class GroupMembership < ActiveRecord::Base
  attr_accessible :group, :user, :role, :group_id, :user_id

  belongs_to :user
  belongs_to :group

  def member
    self.user
  end

  def joining? params
    self.role == MembershipRoles.pending && params[:role] && params[:role] == MembershipRoles.member
  end
end
