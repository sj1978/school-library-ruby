require './student'

class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @student.push(student)
    student.class_room = self
  end
end
