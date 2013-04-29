class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :text
      t.text :user_ids

      t.timestamps
    end
  end
end
