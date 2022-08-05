require_relative './decorate'

class Person < Nameable
# getters
attr_reader :id, :name, :age
attr_accessor :rentals

  def initialize(age, name = 'Unknown', parent_permision = true)
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permision = parent_permision
    @rentals = []
  end

  def correct_name
    @name
  end

  # setters
  def update_id=(value)
    @id = value
  end

  def update_name=(value)
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
