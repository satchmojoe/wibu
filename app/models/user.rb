class User < ActiveRecord::Base
  attr_accessible :bio, :city, :email, :expertises, :institutions, :interests, :password_hash, :password_salt, :state, :tmp_password_hash, :user_name
end
