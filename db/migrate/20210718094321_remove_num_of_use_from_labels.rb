class RemoveNumOfUseFromLabels < ActiveRecord::Migration[6.1]
  def change
    remove_column :labels, :num_of_use, :integer
  end
end
