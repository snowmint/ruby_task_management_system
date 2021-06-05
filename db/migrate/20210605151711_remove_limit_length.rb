class RemoveLimitLength < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :user_account, :username
    change_column :users, :username, :string, :limit => nil
    change_column :tasks, :user_id, "integer USING user_id::integer"
    change_column :tasks, :user_id, :integer, :limit => nil
    change_column :users, :username, :string, :limit => nil
    change_column :labels, :label_name, :string, :limit => nil
  end

  def down
    rename_column :users, :username, :user_account
    change_column :users, :user_account, :string, :limit => 30
    change_column :tasks, :user_id, :string
    change_column :tasks, :user_id, :string, :limit => 30
    change_column :users, :user_account, :string, :limit => 30
    change_column :labels, :label_name, :string, :limit => 30
  end
end
