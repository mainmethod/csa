class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email,            :null => false
      t.text :bio
      t.string :type
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false
      t.references :organization, index: true

      t.timestamps
    end
    
    add_index :users, :email, unique: true

  end
end
