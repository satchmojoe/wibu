class Group < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :documents
  has_many :group_messages
  has_many :projects
  has_many :group_memberships, :dependent => :destroy
  has_many :users, :through => :group_memberships

  def members
    GroupMembership.where(:group_id => self.id).find(:all, :conditions => ["role = ? OR role = ?", MembershipRoles.admin, MembershipRoles.member]).map{|gm| User.find gm.user_id}
  end

  def is_member? user
    self.members.include? user
  end

  def is_admin? user
    GroupMembership.where(:role => MembershipRoles.admin).where(:group_id => self.id).where(:user_id => user.id).count >0
  end

  def pending_member? user
    GroupMembership.where(:role => MembershipRoles.pending).where(:group_id => self.id).where(:user_id => user.id).count >0
  end

  def pending_memberships
    GroupMembership.where(:role => MembershipRoles.pending).where(:group_id => self.id).all
  end

  def admin
    User.find GroupMembership.where(:group_id => self.id).where(:role => MembershipRoles.admin).first.user_id
  end

  def message text
    GroupMessage.create! :message => text, :group_id => self.id
  end
end
