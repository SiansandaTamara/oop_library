require_relative './student'

class CreateStudent
  def initialize(people)
    @people = people
  end

  def create_student
    print 'Enter Age: '
    print 'Age: '
    age = gets.chomp

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
    @people << Student.new(age, name, parent_permission: permission)
    puts
    puts 'Student was created successfuly!'
    puts
  end
end
