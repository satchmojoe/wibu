class Interest < ActiveRecord::Base
  attr_accessible :text, :user_ids
  has_and_belongs_to_many :users
end
