class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :attachment
      t.boolean :completed
      t.integer :row_order
   

      t.timestamps null: false
    end
  end
end
