class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.string :message
      t.integer :group_id

      t.timestamps
    end
  end
end
