require_relative "./person"
require_relative "./student"
require_relative "./rental"
require_relative "./book"
require_relative "./classroom"
require_relative "./teacher"
require_relative "./app.rb"

class Main < App
  def home_screen
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
    num = gets.chomp
    get_method(num)
  end

  def get_method(num)
    case num
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental_by_id
    when '7'
      exit
    else
      puts "Invalid number, please try again"
      puts num
      home_screen
    end
    home_screen
  end
end

m = Main.new()
m.home_screen
