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
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  before_save :handle_bio

  def groups
    self.group_memberships.map{ |m| Group.find(m.group_id) }
  end

  def self.parse_params_for_habtms params
    params[:user]["interests"] = params[:user]["interests"].map{ |i| (i.empty? ? nil : Interest.find(i.to_i))}.delete_if{|x| x == nil} if params[:user]["interests"]
    params[:user]["institutions"] = params[:user]["institutions"].map{ |i| (i.empty? ? nil : Institution.find(i.to_i))}.delete_if{|x| x == nil} if params[:user]["institutions"]
    params[:user]["expertises"] = params[:user]["expertises"].map{ |i| (i.empty? ? nil : Expertise.find(i.to_i))}.delete_if{|x| x == nil} if params[:user]["expertises"]
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
