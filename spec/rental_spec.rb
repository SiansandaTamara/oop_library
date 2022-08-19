require 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new('ahmad', 'any')
    @student = Student.new('ahmad', 'any', 'any')
    @rental = Rental.new('02/12/2022', @book, @student)
  end

  describe '#new' do
    it 'returns new rental object' do
      @rental.should be_an_instance_of Rental
    end
    it 'throws error when arguments less than 3' do
      -> { Rental.new('01/12/2022', 'a person') }.should raise_exception ArgumentError
    end
    it 'throws error when arguments more than 3' do
      -> { Rental.new('date', 'person', 'book', 'extra_argument') }.should raise_exception ArgumentError
    end
  end

  describe 'testing argument values' do
    it 'returns correct person' do
      @rental.person.should eql @student
    end
    it 'returns correct book' do
      @rental.book.should eql @book
    end
  end
end
