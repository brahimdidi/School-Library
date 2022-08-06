require_relative "./person"
require_relative "./student"
require_relative "./rental"
require_relative "./book"
require_relative "./classroom"
require_relative "./teacher"

class App
  @Rentals = []
  def list_all_books
    books = Book.books
    books.select do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    all_people = Student.students + Teacher.teachers
    all_people.select do |person|
      puts "#{person[:profession]} Name: #{person[:name]}, ID: #{person[:ID]}, Age: #{person[:age]}"
    end
  end

  def get_parent_permisison(permission)
    permission.downcase!
    return permission == 'y' || 'yes'
  end

  def create_person
    puts "Do you want to create a student(1) or a teacher(2)"
    who = gets.chomp
    case who
    when '1'
      puts 'Age:'
      student_age = gets.chomp
      puts 'Name:'
      student_name = gets.chomp
      puts 'Has parent permission [Y/N]:'
      student_parent_permission = gets.chomp
      Student.new(student_age, student_name, get_parent_permisison(student_parent_permission))
      puts 'Student created succesfully'

    when '2'
      puts 'Age:'
      teacher_age = gets.chomp
      puts 'Name:'
      teacher_name = gets.chomp
      puts 'Specialization:'
      teacher_specialization = gets.chomp
      Teacher.new(teacher_age, teacher_name, get_parent_permisison(teacher_specialization))
      puts 'Teacher created succesfully'

    else
      'Error: invalid value'
    end
  end

  def create_book
    puts 'title:'
    book_title = gets.chomp
    puts 'Author:'
    book_author = gets.chomp
    Book.new(book_title, book_author)
    puts 'Book created succesfully'
  end

  def create_rental
    books = Book.books
    if books.length == 0; puts "Please add books first"; return; end;
    puts "Select a book from the following list by number"
    books.select do |book|
      puts "( #{books.index(book)} ) Title: #{book.title}, Author: #{book.author}"
    end
    book_number = gets.chomp
    book_selected = books[book_number.to_i]

    people = Student.students + Teacher.teachers
    if people.length == 0; puts "Add people first"; return; end;
    puts "Select a person from the following list by number"
    people.select do |p|
      puts "(#{people.index(p)}) #{p[:profession]} Name: #{p[:name]}, ID: #{p[:ID]}, Age: #{p[:age]}"
    end
    person_number = gets.chomp
    person_selected_index = people[person_number.to_i]
    puts 'Date:'
    rental_date = gets.chomp
    person_class = person_selected_index[:self]
    Rental.new(person_class, book_selected, rental_date)
    puts 'Rental created succesfully'
  end

  def list_rental_by_id
    print "ID of person"
    person_id = gets.chomp
    all_people = Person.people
    puts "Rentals:"
    all_people.select do |person|
      if person.id == person_id.to_i
        rental = person.rentals[0]
        rental_date = rental.date
        rental_book = rental.book
        puts " \n DATE: #{rental_date}, Book #{rental_book.title} by  #{rental_book.author}"
      end
    end
  end
end
