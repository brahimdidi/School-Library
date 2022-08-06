require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  @@teachers = []
  @@count = 0
  def initialize(specitalization, age, name, profession = 'Teacher')
    super(age, name, profession)
    @specitalization = specitalization
    @@teachers << { :ID => @id, :name => name, :age => age, :profession => '[Teacher]', :self => self }
    @@count += 1
  end

  def self.teachers
    @@teachers
  end

  def self.count
    @@count
  end

  def can_use_services?
    true
  end
end
