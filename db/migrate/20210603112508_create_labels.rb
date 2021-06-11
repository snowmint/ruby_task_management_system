class CreateLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :labels do |t|
      t.string :label_name
      t.integer :num_of_use

      t.timestamps
    end
  end
end
