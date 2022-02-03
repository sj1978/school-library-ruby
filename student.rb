require './person'
require './classroom'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission = 'unknown')
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
