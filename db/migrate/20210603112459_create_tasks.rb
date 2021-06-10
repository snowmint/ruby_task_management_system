class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :task_name
      t.text :content
      t.integer :priority
      t.integer :status

      t.timestamps
    end
  end
end
