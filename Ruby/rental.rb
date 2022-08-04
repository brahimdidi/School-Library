class Rental
  attr_accessor :date
  def initialize (date)
    @date
    @books = []
    @person = Person
  end

  def add_book book
    books << book  
  end

end