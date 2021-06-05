class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_id, :user_account
  end
end
