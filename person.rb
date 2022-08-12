require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_service?
    @parent_permission == true || of_age?
  end

  def correct_name
    @name
  end
end
