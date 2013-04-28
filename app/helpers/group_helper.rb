module GroupHelper
  def self.member_ship_status group, user
    if group.is_member? user
      "You are a member of this group"
    else
      ActionController::Base.helpers.link_to "Request to join #{group.name.capitalize}", "/groups/#{group.id}"
    end
  end
end
