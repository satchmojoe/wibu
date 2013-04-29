class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :text
      t.text :user_ids

      t.timestamps
    end
  end
end
