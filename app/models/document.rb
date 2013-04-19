class Document < ActiveRecord::Base
  attr_accessible :file_name

  belongs_to :user 

  belongs_to :group
end
