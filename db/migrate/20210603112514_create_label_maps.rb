class CreateLabelMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :label_maps do |t|
      t.integer :task_id
      t.integer :label_id

      t.timestamps
    end
  end
end
