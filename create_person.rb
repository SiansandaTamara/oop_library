require_relative './create_student'
require_relative './create_teacher'

class CreatePerson
  def initialize(people)
    @people = people
    @create_student = CreateStudent.new(@people)
    @create_teacher = CreateTeacher.new(@people)
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
      @create_student.create_student
    when 2
      @create_teacher.create_teacher
    end
  end
end
