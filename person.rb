require './corrector'
require './rental'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission, :specialization

  def initialize(age, name, parent_permission)
    @id = rand(9999)
    @parent_permission = parent_permission
    @specialization = specialization
    @age = age
    @name = name
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end
end
