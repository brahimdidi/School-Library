class Person
  def initialize(age, name = 'Unknown', parent_permision : true)
    @id
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  # getters
  attr_reader :id
  attr_reader :name
  attr_reader :age

  # setters
  def setId(value)
    @id = value
  end

  def setName(value)
    @name = value
  end

  def can_use_services?
    of_age? || @parent_permision
  end

  private

  def of_age?
    @age >= 18
  end
end
