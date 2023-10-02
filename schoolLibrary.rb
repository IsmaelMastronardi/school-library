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

class Student < Person
  def initialize(age, name = "unknown", parent_permission = true, classroom)
    super(age, name , parent_permission )
    @classroom  = classroom 
  end
  def play_hooky
    puts "¯\\(ツ)/¯"
  end
end

person_1 = Student.new(18, "ismael", false)



puts person_1.name
puts person_1.age
person_1.can_use_services?
person_1.play_hooky