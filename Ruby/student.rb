require_relative './person'

class Student < Person
  attr_accessor :classroom

  @@students = []
  def initialize(classroom = 'unset', age, name, profession)
    super(age, name, profession)
    @classroom = classroom
    @@students << { :ID => @id, :name => name, :age => age, :profession => '[Student]', :self => self }
  end

  def self.students
    @@students
  end
  puts @@students
  def play_hooky
    "¯\(ツ)/¯"
  end
end
