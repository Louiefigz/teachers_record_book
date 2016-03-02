class CreateAssignments < ActiveRecord::Migration
  def change
      create_table :assignments do |t|
        t.string :name
        t.integer :curriculum_id
    end 
  end
end
