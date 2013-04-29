class Project < ActiveRecord::Base
  attr_accessible :description, :group_id, :name

  belongs_to :group
  has_many :tasks
end
