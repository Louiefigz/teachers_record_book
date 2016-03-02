class Curriculum < ActiveRecord::Base
  belongs_to :class_name
  has_many :assignments
  include Sluggable::InstanceMethods
extend Sluggable::ClassMethods

end
