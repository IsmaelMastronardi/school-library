require './person'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './student'
require './classroom'

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
