class AddAttachmentDocumentToDocuments < ActiveRecord::Migration
  def change
    change_table :documents do |t|
      t.string :document
    end
  end
end
