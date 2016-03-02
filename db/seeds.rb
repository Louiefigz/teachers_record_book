


@teacher = Teacher.create(name: "Marshal Mathers", username: "marshal", password: "12345")
@teacher_1 = Teacher.create(name: "Big Poppa", username: "big_poppa", password: "12345")
@teacher_2 = Teacher.create(name: "P Diddy")

@student = Student.create(name: "Andrew Burke")
@student_1 = Student.create(name: "Aaron Figs")
@student_2 = Student.create(name: "G6")


@class = ClassName.create(name: "English", teacher_id: @teacher.id)
@class_1 = ClassName.create(name: "Biology", teacher_id: @teacher_1.id)
@class_2 = ClassName.create(name: "Life Studies", teacher_id: @teacher.id)


@curriculum = Curriculum.create(name: "Learning to read from left to 'write'", class_name_id: @class.id)
@curriculum_1 = Curriculum.create(name: "Intro to Becoming literate", class_name_id: @class_1.id)
@curriculum_2 = Curriculum.create(name: "mastering reading", class_name_id: @class.id)



@assignment = Assignment.create(name: "Read Page 439-845", curriculum_id: @curriculum.id)
@assignment_1 = Assignment.create(name: "Write that damn essay", curriculum_id: @curriculum_1.id)
@assignment_2 = Assignment.create(name: "Be the poem", curriculum_id: @curriculum_2.id)

# @curriculum_3 = Curriculum.create(name: "")
# @curriculum_4 = Curriculum.create(name: "Intro to Becoming literate")
# @curriculum_5 = Curriculum.create(name: "mastering reading")


StudentTeacherClass.create(class_name_id: @class.id, student_id: @student.id)
StudentTeacherClass.create(class_name_id: @class_1.id, student_id: @student.id)
