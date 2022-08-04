require_relative './decorate'

class Person < Nameable
  @rentals = []
  def initialize(age, name = 'Unknown', parent_permision = true)
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  # getters
  attr_reader :id, :name, :age

  def correct_name
    @name
  end

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

  # add rentals 
  def add_rental rental
    rentals << rental
  end

  private

  def of_age?
    @age >= 18
  end
end
