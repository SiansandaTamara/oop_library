class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book

    # associations
    book.rentals << self
    person.rental << self
  end
end
