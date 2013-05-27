class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :project_id, :status, :user_id, :user

  belongs_to :project
  belongs_to :user
  has_one :group, :through => :project

  validates_presence_of :name
  validates_presence_of :description

  def owner
    self.user.user_name
  end

  def group
    self.project.group
  end

  def group_id
    self.project.group_id
  end
end
