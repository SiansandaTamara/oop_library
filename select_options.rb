require_relative 'create_book'
require_relative 'create_person'
require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'create_rental'

class Options
  attr_accessor :title, :author

  def initialize
    @people = []
    @books = []
    @all_rentals = []
    @create_person = CreatePerson.new(@people)
    @create_book = CreateBook.new(@books)
    @create_rental = CreateRental.new(@people, @books)
  end

  def menu_options
    puts '1: List All Books'
    puts '2: List All People'
    puts '3: Create A Person'
    puts '4: Create A Book'
    puts '5: Create A Rental'
    puts '6: List All Rentals For A Given Person ID'
    puts '7: Exit The Program'
  end

  def run
    puts 'Welcome to the book store'
    option = nil
    while option != 7
      puts 'Please enter a number to choose an option: '
      menu_options
      print '(Option number): '
      option = gets.chomp.strip.to_i
      choice_options(option)
      puts
    end
    puts ' Closing Application '
    puts '      Good Bye!      '
  end

  def choose_option(operation)
    case operation
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      @create_person.create_person
    when '4'
      @create_book.create_book
    when '5'
      @create_rental.create_rental
    when '6'
      list_all_rentals
    end
  end

  def list_all_people
    key = 1
    puts
    puts 'People'.upcase
    puts
    puts 'No people yet! Choose option 3 to add a person ' if @people.empty?
    @people.each do |person|
      print "#{key} - [#{person.class.name} ID]: #{person.id} Age: #{person.age} Name: #{person.name} "
      print "Parent Permission: #{person.parent_permission}" if person.is_a?(Student)
      print "Specialization: #{person.specialization}" if person.is_a?(Teacher)
      puts
      key += 1
    end
  end

  def list_all_books
    key = 1
    puts
    puts 'Books'.upcase
    puts
    puts 'No book yet! Choose option 4 to add a book ' if @books.empty?
    @books.each do |book|
      puts "#{key} - #{book.title} by #{book.author}"
      key += 1
    end
  end

  def list_all_rentals
    puts
    list_all_people
    puts 'Choose person ID: '
    entry = gets.chomp.to_i

    puts 'Rentals'.upcase
    puts
    @people.each do |person|
      next unless person.id == entry

      @all_rentals.each do |rental|
        puts "Rental date: #{rental.date} - #{rental.book} by #{rental.person}"
      end
    end
  end
end
