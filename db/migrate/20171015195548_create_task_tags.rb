class CreateTaskTags < ActiveRecord::Migration
  def change
    create_table :task_tags do |t|
      t.integer :tag_id
      t.integer :task_id
    end
  end
end
