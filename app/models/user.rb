class User < ActiveRecord::Base
  attr_accessible :bio, :city, :email, :expertises, :institutions, :interests, :password_hash, :password_salt, :state, :tmp_password_hash, :user_name
  has_and_belongs_to_many :expertises
  has_and_belongs_to_many :institutions
  has_and_belongs_to_many :interests

  has_many :documents
  has_many :group_memberships
  has_many :tasks

  def self.parse_params_for_habtms params
    params[:user]["interests"] = params[:user]["interests"].map{ |i| (i.empty? ? nil : Interest.find(i.to_i)) }
    params
  end
end
