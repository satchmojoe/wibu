class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :bio, :city, :email, :expertises, :institutions, :interests, :password, :password_confirmation, :state, :user_name, :group_memberships
  has_and_belongs_to_many :expertises
  has_and_belongs_to_many :institutions
  has_and_belongs_to_many :interests

  has_many :documents
  has_many :group_memberships
  has_many :tasks

  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  def groups
    self.group_memberships.map{ |m| Group.find(m.group_id) }
  end

  def self.parse_params_for_habtms params
    binding.pry
    params[:user]["interests"] = params[:user]["interests"].map{ |i| (i.empty? ? nil : Interest.find(i.to_i))}.delete_if{|x| x == nil}
    params[:user]["institutions"] = params[:user]["institutions"].map{ |i| (i.empty? ? nil : Institution.find(i.to_i))}.delete_if{|x| x == nil}
    params[:user]["expertises"] = params[:user]["expertises"].map{ |i| (i.empty? ? nil : Expertise.find(i.to_i))}.delete_if{|x| x == nil}
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
      user.tmp_password_hash = ""
      user.save
      user
    else
      nil
    end
  end
end
