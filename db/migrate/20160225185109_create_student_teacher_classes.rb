class CreateStudentTeacherClasses < ActiveRecord::Migration
  def change
    create_table :student_teacher_classes do |t|
      t.integer :class_name_id
      t.integer :student_id
    end
  end
end
