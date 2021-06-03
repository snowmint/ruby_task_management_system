class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_id, limit: 30
      t.string :password, limit: 500
      t.string :user_fullname

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
