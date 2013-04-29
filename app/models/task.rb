class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :project_id, :status, :user_id

  belongs_to :project
  belongs_to :user
end
