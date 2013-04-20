class ExpertisesUsers < ActiveRecord::Migration
  def up
    create_table :expertises_users, :id => false do |t|
      t.integer :expertise_id
      t.integer :user_id
    end
  end

  def down
    drop_table :expertises_users
  end
end
