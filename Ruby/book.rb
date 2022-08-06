class Book
  attr_accessor :title, :author, :rentals

  @@books = []
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books << self
  end

  def self.books
    @@books
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end
end
