class AddPriorityIndexToTask < ActiveRecord::Migration[6.1]
  def change
    add_index(:tasks, :priority)
  end
end
