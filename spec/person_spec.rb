require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(22, 'zamir')
  end

  describe '#new' do
    it 'returns new person object' do
      @person.should be_an_instance_of Person
    end
    it 'throws error when arguments less than 1' do
      -> { Person.new }.should raise_exception ArgumentError
    end
    it 'throws error when arguments more than 3' do
      -> { Person.new('age', 'name', true, 'extra_argument') }.should raise_exception ArgumentError
    end
  end

  describe 'testing argument values' do
    it 'returns correct age' do
      @person.age.should eql 22
    end
    it 'returns correct name' do
      @person.name.should eql 'zamir'
    end
  end
end
