require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  @@teachers = []
  def initialize(specitalization, age, name, profession = 'Teacher')
    super(age, name, profession)
    @specitalization = specitalization
    @@teachers << { :ID => @id, :name => name, :age => age, :profession => '[Teacher]', :self => self }

  end

  def self.teachers
    @@teachers
  end


  def can_use_services?
    true
  end
end
