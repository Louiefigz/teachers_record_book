class CreateClassNames < ActiveRecord::Migration
  def change
      create_table :class_names do |t|
      t.string :name
      t.integer :teacher_id
    end
  end
end
