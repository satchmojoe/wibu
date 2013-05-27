class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :bio, :city, :email, :expertises, :institutions, :interests, :password, :password_confirmation, :state, :user_name, :group_memberships
  has_and_belongs_to_many :expertises
  has_and_belongs_to_many :institutions
  has_and_belongs_to_many :interests

  has_many :documents
  has_many :group_memberships
  has_many :tasks
  has_many :groups, :through => :group_memberships

  before_save :encrypt_password
  before_save :handle_bio
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :user_name
  validates_presence_of :email

  validates_uniqueness_of :email, :case_sensitive => false
  validates_uniqueness_of :user_name, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def groups
    self.group_memberships.map{ |m| Group.find(m.group_id) }
  end

  def self.parse_params_for_habtms params
    params[:user]["interests"] = params[:user]["interests"].gsub(" ","_").split(',').collect{|i| (Interest.find_by_text(i) || Interest.create!(:text => i))}.delete_if{|x| x == nil} if params[:user]["interests"]


    params[:user]["institutions"] = params[:user]["institutions"].gsub(" ","_").split(',').collect{|i| (Institution.find_by_text(i) || Institution.create!(:text => i))}.delete_if{|x| x == nil} if params[:user]["institutions"]

    params[:user]["expertises"] = params[:user]["expertises"].gsub(" ","_").split(',').collect{|i| (Expertise.find_by_text(i) || Expertise.create!(:text => i))}.delete_if{|x| x == nil} if params[:user]["expertises"]

    params
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end



  def self.authenticate(user_name, password)
    user = find_by_user_name(user_name)
    if user && (user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) || user.tmp_password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) )
      user
    else
      nil
    end
  end

  def handle_bio
    self.bio ||= ""
  end

end
