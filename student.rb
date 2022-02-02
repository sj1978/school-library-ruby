require './person'
require './classroom'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission = 'unknown')
    super(age, name, parent_permission)
  end

  attr_accessor :class_room

  def play_hooky
    '¯\(ツ)/¯'
  end
end
