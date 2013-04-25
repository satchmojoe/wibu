class GroupMembership < ActiveRecord::Base
  attr_accessible :group, :user

  belongs_to :user
  belongs_to :group

  def member
    self.user
  end
end
