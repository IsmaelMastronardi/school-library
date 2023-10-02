require './Person.rb'

class Person
  attr_reader :id
  attr_accessor  :age ,:name
  def initialize(age, name = "unknown", parent_permission = true)
    @id = rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    puts of_age? || @parent_permission
  end

  private
  def of_age?
    @age >= 18
  end
end