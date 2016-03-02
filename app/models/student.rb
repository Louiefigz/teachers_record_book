class Student < ActiveRecord::Base
  has_many :student_teacher_classes
  has_many :class_names, through: :student_teacher_classes
  has_many :teachers, through: :student_teacher_classes
  has_many :curriculums, through: :class_names
  has_many :assignments, through: :curriculums
  include Sluggable::InstanceMethods
extend Sluggable::ClassMethods
end
