require './person'
require './base_decorator'
require './capitalize_decorator'
require './trimmer_decorator'
require './student'
require './classroom'
require './book'
require './rental'
require './teacher'
class App
  def initialize 
    @students = []
    @teachers = []
    @books = []
    @rentals = []
  end

 def options
  puts "1 - List all books."
  puts "2 - List all people."
  puts "3 - Create a person (teacher or student, not a plain Person)."
  puts "4 - Create a book."
  puts "5 - Create a rental."
  puts "6 - List all rentals for a given person id."
  puts "q - quit"
  input = gets.chomp

  case input
    when "1" 
      list_all_books
    when "2"
      list_all_people
    when "3"
      create_a_person
    when "4"
      create_a_book
    when "5"
      create_a_rental
    when "6"
      list_all_rentals
    when 'q'
      quit_app
    else 
      puts 'there was an error'
    end
  end

  def list_all_books
    if @books.length === 0 
      puts 'no books yet'
    else 
      @books.map{|book| puts book.title}
    end
    options
  end

 def list_all_people
  if @students.length === 0 && @teachers.length === 0
    puts 'no people yet'
  elsif @students.length > 0
    @students.map{|student| puts "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"}
  elsif @teachers.length > 0
    @teachers.map{|teacher| puts "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"}
  end
  options
 end

 def create_a_person
  print 'Do you want to create a student (1) of a teacher (2)[Input the number]: '
  input = gets.chomp.to_i
  if input === 1 
    create_a_student
  else 
    create_a_teacher
  end
 end 

 def create_a_student
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission= [Y/N]: '
  permissionInput = gets.chomp.upcase
  permission = true
  if permissionInput === 'N'
    permission = false
  end
  student = Student.new(permission, age, name)
  @students.push(student)
  puts 'Person created successfully'
  options
 end

 def create_a_teacher
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp.upcase
  teacher = Teacher.new(specialization, age, name)
  @teachers.push(teacher)
  puts 'Person created successfully'
  options
 end

 def create_a_book
  print '[TITLE]: '
  title = gets.chomp
  print '[AUTHOR]: '
  author = gets.chomp
  book = Book.new(title, author)
  @books.push(book)
  puts 'book created'
  options
 end

 def create_a_rental
  puts 'Create a rental'
 end

 def list_all_rentals
  puts 'List all rentals'
 end

 def quit_app
  puts 'goodbye'
 end

end