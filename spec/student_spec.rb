require 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('any')
    @student = Student.new(@classroom, 34, 'stan')
  end

  describe '#new' do
    it 'returns new student object' do
      @student.should be_an_instance_of Student
    end
    it 'throws error when arguments less than 3' do
      -> { Student.new }.should raise_exception ArgumentError
    end
    it 'throws error when arguments more than 3' do
      -> { Student.new('classroom', 'age', 'any', 'extra_argument') }.should raise_exception ArgumentError
    end
  end

  describe 'testing argument values' do
    it 'returns correct age' do
      @student.age.should eql 34
    end
    it 'returns correct name' do
      @student.name.should eql 'stan'
    end
    it 'returns correct classroom' do
      @student.classroom.should eql @classroom
    end
  end
end
