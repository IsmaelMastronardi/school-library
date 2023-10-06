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

  def run
    puts 'Welcome to School Library App!'
    options
  end

  def options
    puts '1 - List all books.'
    puts '2 - List all people.'
    puts '3 - Create a person.'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person id.'
    puts '7 - Exit'
    choose_options
  end

  def choose_options
    input = gets.chomp
    case input
    when '1' then list_all_books('list')
    when '2' then list_all_people('list')
    when '3' then create_a_person
    when '4' then create_a_book
    when '5' then rental_values
    when '6' then list_all_rentals
    else quit_option(input)
    end
  end

  def quit_option(input)
    return unless input == '7'

    quit_app
  end

  def list_all_books(action)
    if @books.empty?
      puts 'no books yet'
      options
    else
      @books.map.with_index do |book, index|
        print "#{index})"
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
      puts
    end
    return unless action != 'rental'

    puts
    options
  end

  def list_all_people(action)
    if @people.empty?
      puts 'no people yet'
      options
    end
    @people.map.with_index do |person, index|
      print "#{index})"
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    return unless action != 'rental'

    puts
    options
  end

  def create_a_person
    print 'Do you want to create a student (1) of a teacher (2)[Input the number]: '
    input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if input == 1
      create_a_student(name, age)
    else
      create_a_teacher(name, age)
    end
  end

  def create_a_student(name, age)
    print 'Has parent permission= [Y/N]: '
    permission_input = gets.chomp.upcase
    permission = true
    permission = false if permission_input == 'N'
    student = Student.new(permission, age, name)
    @people.push(student)
    puts 'Person created successfully'
    puts
    options
  end

  def create_a_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp.upcase
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
    puts
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
    puts
    options
  end

  def rental_values
    puts 'Select a book from the following list by number'
    list_all_books('rental')
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people('rental')
    person_index = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    create_rental(date, book_index, person_index)
    puts 'Rental created successfully'
    puts
    options
  end

  def create_rental(date, book_index, person_index)
    book = @books[book_index]
    person = @people[person_index]
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    @rentals.each { |item| puts item.person.id }
  end

  def list_all_rentals
    puts 'ID of person: '
    id = gets.chomp
    puts 'Rentals: '
    person_rentals = @rentals.select { |item| item.person.id == id}
    person_rentals.map.with_index do |item, _index|
      puts "Date: #{item.date}, Book: \"#{item.book.title}\" by #{item.book.author}"
    end
    puts
    options
  end

  def quit_app
    puts 'Thank you for using this app!'
    exit
  end
end
