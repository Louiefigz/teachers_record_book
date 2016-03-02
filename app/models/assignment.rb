class Assignment < ActiveRecord::Base
  belongs_to :curriculum
  include Sluggable::InstanceMethods
extend Sluggable::ClassMethods
end
