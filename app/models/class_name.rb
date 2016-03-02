class ClassName < ActiveRecord::Base

  belongs_to :teacher
  has_many :student_teacher_classes
  has_many :students, through: :student_teacher_classes
  has_many :curriculums, dependent: :destroy
  has_many :assignments, through: :curriculums, dependent: :destroy
  include Sluggable::InstanceMethods
extend Sluggable::ClassMethods


  def self.create_new_class(session, params)
    @teacher = Teacher.find(session[:user_id])
    @class = ClassName.create(name: params[:name], teacher_id: @teacher.id)

    params[:student].each do |student|

      if student[:name] != ""
        student = Student.create(student)
        StudentTeacherClass.create(student_id: student.id, class_name_id: @class.id)
      end
    end

    @teacher
  end

end
