require './teacher'
require './book'
require './student'

describe Rental do
  before :each do
    @person = Student.new nil, nil, 19, 'charles', parent_permission: true
    @book = Book.new nil, 'Hello', 'World'
    @rental = Rental.new '2022/06/22', @person, @book
  end
end
