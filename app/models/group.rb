class Group < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :documents
  has_many :group_messages
  has_many :projects
  has_many :group_memberships
end
