class GroupMembership < ActiveRecord::Base
  attr_accessible :group, :user, :role, :group_id, :user_id

  belongs_to :user
  belongs_to :group

  def member
    self.user
  end
end
