class InstitutionsUsers < ActiveRecord::Migration
  def up
    create_table :institutions_users, :id => false do |t|
      t.integer :institution_id
      t.integer :user_id
    end
  end

  def down
    drop_table :institutions_users
  end
end
