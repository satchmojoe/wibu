class CreateExpertises < ActiveRecord::Migration
  def change
    create_table :expertises do |t|
      t.string :text
      t.text :user_ids

      t.timestamps
    end
  end
end
