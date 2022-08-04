class Book
  attr_accessor :title, :author

  @rental = Rental
  def intialize(title, author)
    @title = title
    @author = author
  end
end
