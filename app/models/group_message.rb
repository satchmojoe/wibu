class GroupMessage < ActiveRecord::Base
  attr_accessible :group_id, :message

  belongs_to :group
end
