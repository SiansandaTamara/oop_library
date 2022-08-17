require_relative './teacher'

class CreateTeacher
  def initialize(people)
    @people = people
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

    @people << Teacher.new(age, name, specialization)
    puts ' Teacher was created successfuly! '
  end
end
