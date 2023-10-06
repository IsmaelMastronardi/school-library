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
    @people = []
    @books = []
    @rentals = []
  end

 def options
  puts "1 - List all books."
  puts "2 - List all people."
  puts "3 - Create a person."
  puts "4 - Create a book."
  puts "5 - Create a rental."
  puts "6 - List all rentals for a given person id."
  puts "7 - Exit"
  input = gets.chomp

  case input
    when "1" 
      list_all_books('list')
    when "2"
      list_all_people('list')
    when "3"
      create_a_person
    when "4"
      create_a_book
    when "5"
      get_rental_values
    when "6"
      list_all_rentals
    when 'q'
      quit_app
    else 
      puts 'there was an error'
    end
  end

  def list_all_books(action)
    if @books.length === 0 
      puts 'no books yet'
    else 
      @books.map.with_index{
        |book, index| 
        if action === 'rental'
          print "#{index}\)"
        end
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      }
      puts
    end
    if action != 'rental'
       options
    end
  end

 def list_all_people(action)
  if @people.length === 0 
    puts 'no people yet'
  end
  @people.map.with_index{
    |person, index|
    if action === 'rental' 
      print "#{index}\)"
    end
    puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  }
  if action != "rental"
    options
  end
 end

 def create_a_person
  print 'Do you want to create a student (1) of a teacher (2)[Input the number]: '
  input = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  if input === 1 
    create_a_student(name, age)
  else 
    create_a_teacher(name, age)
  end
 end 

 def create_a_student(name, age)
  print 'Has parent permission= [Y/N]: '
  permissionInput = gets.chomp.upcase
  permission = true
  if permissionInput === 'N'
    permission = false
  end
  student = Student.new(permission, age, name)
  @people.push(student)
  puts 'Person created successfully'
  options
 end

 def create_a_teacher(name, age)
  print 'Specialization: '
  specialization = gets.chomp.upcase
  teacher = Teacher.new(specialization, age, name)
  @people.push(teacher)
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

 def get_rental_values
  puts 'Select a book from the following list by number'
  list_all_books('rental')
  bookIndex = gets.chomp.to_i
  puts 'Select a person from the following list by number (not id)'
  list_all_people('rental')
  personIndex = gets.chomp.to_i
  puts "Date: "
  date = gets.chomp
  create_rental(date, bookIndex, personIndex)
  puts "Rental created successfully"
  options
 end

 def create_rental(date, bookIndex, personIndex)
  book = @books[bookIndex]
  person = @people[personIndex]
  rental = Rental.new(date, book, person)
  @rentals.push(rental)
  @rentals.each do |rental| puts rental.person.id end
  
 end

 def list_all_rentals
  puts 'ID of person: '
  id = gets.chomp
  puts 'Rentals: '
  @rentals.each do |rental| puts rental.person.id end
  person_rentals = @rentals.select {|rental| rental.person.id === id.to_i} 
  person_rentals.map.with_index{
    |rental, index| 
    puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
  }
  puts 
  options
 end

 def quit_app
  puts 'Thank you for using this app!'
 end

end
