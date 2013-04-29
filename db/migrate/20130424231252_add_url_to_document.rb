class AddUrlToDocument < ActiveRecord::Migration
  def change
    change_table :documents do |t|
      t.string :url
    end
  end
end
