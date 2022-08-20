require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('newbook', 'newauthor')
  end

  describe '#new' do
    it 'returns new book object' do
      @book.should be_an_instance_of Book
    end
    it 'throws error when arguments less than 2' do
      -> { Book.new('title') }.should raise_exception ArgumentError
    end
    it 'throws error when arguments more than 2' do
      -> { Book.new('title', 'book', 'extra_argument') }.should raise_exception ArgumentError
    end
  end

  describe 'testing argument values' do
    it 'returns correct title' do
      @book.title.should eql 'newbook'
    end
    it 'returns correct author' do
      @book.author.should eql 'newauthor'
    end
  end
end
