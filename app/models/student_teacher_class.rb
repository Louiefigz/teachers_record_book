class StudentTeacherClass < ActiveRecord::Base

belongs_to :class_name
  belongs_to :teacher
  belongs_to :student
  include Sluggable::InstanceMethods
extend Sluggable::ClassMethods

end
