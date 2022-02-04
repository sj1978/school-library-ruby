require './book'
require './person'
require './student'
require './teacher'
require './classroom'
require './rental'

class Main
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end
  # rubocop:disable Metrics/CyclomaticComplexity

  def start
    puts "Welcome to School Library App!

    Please choose and option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create person
    4 - Create book
    5 - Create rental
    6 - List all rentals for person id
    7 - Exit
    "
    option = gets.chomp
    case option
    when '1' then display_books
    when '2' then display_people
    when '3' then add_person
    when '4' then add_book
    when '5' then add_rental
    when '6' then display_rentals
    when '7' then puts 'See you soon!'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def add_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @book_list << Book.new(title, author)
    puts "Book: '#{title}' has been created successfully"

    start
  end

  def display_books
    if @book_list.empty?
      puts '( No Books Found )'
    else
      @book_list.each_with_index.map do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    start
  end

  def add_person
    puts 'Do you want to create a student(1) or a teacher(2)? [input the number]:'
    person_created = gets.chomp
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    name = gets.chomp
    case person_created
    when '1'
      puts 'Permission? [y/n] :'
      permission = gets.chomp
      @people_list << Student.new(age, name, permission)
      puts 'Student added successfully'
    else
      puts 'Specialization?: '
      special = gets.chomp
      @people_list << Teacher.new(age, name, special)
      puts 'Teacher added successfully'
    end
    start
  end

  def display_people
    if @people_list.empty?
      puts '( List is empty )'
    else
      @people_list.each_with_index.map do |p, index|
        puts "#{index}) Name: \"#{p.name}\", Age: #{p.age} Id:#{p.id}"
      end
    end
    start
  end

  def add_rental
    puts 'Select a book from the following list by number'
    @book_list.each_with_index.map do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    index_book = gets.chomp.to_i
    puts 'Select a person from the following list by number'

    @people_list.each_with_index.map do |person, index|
      puts "#{index})[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    index_person = gets.chomp.to_i
    print 'Date: '
    rent_date = gets.chomp
    rental = Rental.new(rent_date)
    @book_list[index_book].add_rental(rental)
    @people_list[index_person].add_rental(rental)
    @rental_list << rental
    puts 'Rental has been created successfully'
    start
  end

  def display_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people_list.select { |target| target.id == person_id }[0]
    person.rentals.map { |rent| puts "Data: #{rent.date}, Book: \"#{rent.book.title}\", by #{rent.book.author}" }
  end
end

def run
  app = Main.new
  app.start
end

run
