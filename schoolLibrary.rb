require './Person.rb'
require './Teacher.rb'
require './Student.rb'

person_1 = Teacher.new(10, "ismael", false)



puts person_1.name
puts person_1.age
puts person_1.can_use_services?