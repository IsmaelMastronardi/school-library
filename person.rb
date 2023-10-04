require './nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :age, :name

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    puts of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
