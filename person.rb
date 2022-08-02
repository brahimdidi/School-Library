class Person
  def initialize(age, name = 'Unknown', parent_permision : true)
    @id = Random.rand(1..10000)
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  # getters
  attr_reader :id, :name, :age

  # setters
  def update_id(value)
    @id = value
  end

  def update_name(value)
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
