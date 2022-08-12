require './person'
require './classroom'
require './book'
require './rental'
require './student'
require './teacher'
require 'date'

# rubocop:disable Metrics/ClassLength, Metrics/CyclomaticComplexity

class App
  def initialize
    @rentals = []
    @people = []
    @books = []
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

  def choice_options(option)
    case option
    when 1
      all_books
    when 2
      all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      nil
    else
      puts 'Invalid option! '
      puts 'Please enter a valid option from the following: '
      menu_options
    end
  end

  def create_person
    entry = nil
    print 'Choose option 1 to create a Student or option 2 for a Teacher: '
    until [1, 2].include?(entry)
      entry = gets.chomp.strip.to_i
      puts
      puts 'Choose option 1 for Student or option 2 for Teacher' unless [1, 2].include?(entry)
    end
    case entry
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def all_people
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

  def all_books
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

  def create_teacher
    age = -1
    print 'Enter Age: '
    while age <= 0
      age = gets.chomp.to_i
      print 'Enter valid age for Teacher: ' if age <= 0
    end

    print 'Enter Name: '
    name = gets.chomp.strip.capitalize

    print 'Enter Specialization: '
    specialization = gets.chomp.strip.capitalize

    @people << Teacher.new(specialization, age, name = name)
    puts ' Teacher was created successfuly! '
  end

  def create_student
    print 'Enter Age: '
    print 'Age: '
    age = gets.chomp.to_i

    print 'Enter Name: '
    name = gets.chomp.strip.capitalize

    print 'Does student have parent permission? (Y/N): '
    permission = gets.chomp.strip.upcase

    case permission
    when 'Y', 'YES'
      permission = true
    when 'N', 'NO'
      permission = false
    end
    @people << Student.new(age, name = name, parent_permission: permission)
    puts
    puts 'Student was created successfuly!'
    puts
  end

  def create_book
    print 'Enter Title: '
    title = gets.chomp.strip.capitalize

    print 'Enter Author: '
    author = gets.chomp.strip.capitalize

    @books << Book.new(title, author)
    puts
    puts 'Book was created successfully!'
    puts
  end

  def create_rental
    if @books.size.zero?
        puts 'No Books Available'
      elsif @people.size.zero?
        puts 'No Person Available'
      else
        puts 'Select a book from the following list by number'
        @books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
        rental_book = gets.chomp.to_i
        puts 'Select a person from the following list by number (not id)'
        @people.each_with_index do |person, index|
          puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
        end
        rental_person = gets.chomp.to_i
        puts 'Enter date in format YYYY-MM-DD'
        date = convert_date(gets)
        rental_detail = Rental.new(@people[rental_person], @books[rental_book], date)
        @rentals.push(rental_detail)
        puts 'Rental Successfully Created'
      end
  end

  def list_rentals
    puts
    all_people
    puts 'Choose person ID: '
    entry = gets.chomp.to_i

    puts 'Rentals'.upcase
    puts
    @people.each do |person|
      next unless person.id == entry

      @rentals.each do |rental|
        puts "Rental date: #{rental.date} - #{rental.book} by #{rental.person}"
      end
    end
  end

  def convert_date(str)
    Date.parse(str)
  end
end

# rubocop:enable Metrics/ClassLength, Metrics/CyclomaticComplexity
