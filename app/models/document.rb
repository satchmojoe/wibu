class Document < ActiveRecord::Base
  attr_accessible :file_name, :document

  belongs_to :user 

  belongs_to :group

  mount_uploader :document, DocumentsUploader

  def self.upload_doc doc, owner
    new_document = Document.new :document => doc, :file_name => doc.original_filename
    new_document.document = File.open("public/data/#{doc.original_filename}", File::CREAT)

    owner.is_a?(Group) ? new_document.group_id=onwer.id : new_document.user_id=owner.id
    new_document.save!
    new_document.url = new_document.document.url
    #Url is not made permanent until saved
    new_document.save!
  end

  def download_permitted? user
    if (self.user_id != nil || !self.user_id.to_s.empty?) && 
        (self.group_id == nil || self.group_id.to_s.empty)
      return true
    elsif self.group_id && (Group.find(self.group_id).members.include? user)
      return true
    else
      return false
    end
  end
end
