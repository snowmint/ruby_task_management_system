class ChangeColumnLengthLimit < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :password, :string, :limit => 256
  end
end
