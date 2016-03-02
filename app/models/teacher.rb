class Teacher < ActiveRecord::Base

  has_secure_password
  has_many :class_names
  has_many :student_teacher_classes, through: :class_names
  has_many :students, through: :student_teacher_classes
  has_many :curriculums, through: :class_names
  has_many :assignments, through: :curriculums
  include Sluggable::InstanceMethods
extend Sluggable::ClassMethods
end
