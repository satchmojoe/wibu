class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :bio
      t.string :city
      t.string :state
      t.string :password_hash
      t.string :password_salt
      t.string :tmp_password_hash
      t.text :interests
      t.text :expertises
      t.text :institutions

      t.timestamps
    end
  end
end
