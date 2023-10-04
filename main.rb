require './person'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './student'
require './classroom'
require './book'
require './rental'

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

# student1 = Student.new('math', 22, 'ismael')


# mathClassroom = Classroom.new('matematicas')
# puts '1'
# puts mathClassroom.students

# puts '2'
# puts student1.classroom
# puts '3'
# puts mathClassroom.add_student(student1)
# puts '4'
# puts student1.classroom
# puts '5'
# puts student1.classroom.label
# puts '6'
# puts mathClassroom.students


# puts '7'
# puts mathClassroom.students.count
# puts '8'
# puts mathClassroom.students.first.name
# puts '9'
# puts mathClassroom.students.first.age

# student2 = Student.new('matematicas', 45, 'flavio')
# puts '10'
# puts student2.classroom
# puts mathClassroom.students.count

# student2.classroom = mathClassroom

# puts '11'
# puts student2.classroom
# puts '12'
# puts mathClassroom.students.count
# puts '13'
# puts mathClassroom.students.last
# puts '14'
# puts mathClassroom.students.last.name

person1 = Person.new(20,'ismael')
person2 = Person.new(40, 'flavio')

book1 = Book.new('stormligth', 'branderson')
book2 = Book.new('harryPotter', 'j.k.rawling')

rental1 = Rental.new('2021/01/01',book1,person1)
rental2 = Rental.new('2022/02/02',book1,person1)

puts person1.rentals.count

puts person1.rentals.map {|rental| rental.date}

puts book1.rentals.count

puts book2.rentals.count

puts book1.rentals.map {|rental| rental.date}

rental3 = Rental.new('2023/03/03',book2,person2)
rental4 = Rental.new('2024/04/04',book2,person1)

puts person2.rentals.count

puts person2.rentals.map {|rental| rental.date}

puts book2.rentals.count

puts book2.rentals.map {|rental| rental.date}

puts book1.rentals.count

puts book1.rentals.map {|rental| rental.date}
