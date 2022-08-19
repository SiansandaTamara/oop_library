require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('specialization', 34, 'teacher_name')
  end

  describe '#new' do
    it 'returns new teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
    it 'throws error when arguments less than 3' do
      -> { Teacher.new }.should raise_exception ArgumentError
    end
    it 'throws error when arguments more than 3' do
      -> { Teacher.new('specialization', 'age', 'any', 'extra_argument') }.should raise_exception ArgumentError
    end
  end

  describe 'testing argument values' do
    it 'returns correct age' do
      @teacher.age.should eql 34
    end
    it 'returns correct name' do
      @teacher.name.should eql 'teacher_name'
    end
  end
end
