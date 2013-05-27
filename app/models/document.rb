class Document < ActiveRecord::Base
  attr_accessible :file_name, :document

  belongs_to :user 

  belongs_to :group

  mount_uploader :document, DocumentsUploader
  validates_presence_of :document

  before_save :check_extension

  def self.upload_doc doc, owner
    new_document = Document.new :document => doc, :file_name => doc.original_filename
    new_document.document = File.open("public/data/#{doc.original_filename}", File::CREAT)

    owner.is_a?(Group) ? new_document.group_id=owner.id : new_document.user_id=owner.id
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

  def set_up request
    if "users" == request.env["HTTP_REFERER"].split("#{request.protocol}#{request.host_with_port}")[1].split('/')[1]
      self.user_id = request.env["HTTP_REFERER"].split("#{request.protocol}#{request.host_with_port}")[1].split('/')[2]
    elsif "groups" == request.env["HTTP_REFERER"].split("#{request.protocol}#{request.host_with_port}")[1].split('/')[1]
      self.group_id = request.env["HTTP_REFERER"].split("#{request.protocol}#{request.host_with_port}")[1].split('/')[2]
    end
    self.url = self.document.url
    self.file_name = self.document.filename
    self.save
  end
  
  private
  
  def check_extension
    ['txt', 'doc', 'docx', 'pdf', 'jpeg', 'odt', 'png', 'zip', 'tar', 'gzip', 'tar.gzip'].include? self.document.to_s.split('.')[1]
  end
end
