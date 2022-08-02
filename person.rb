class Person
  def initialize(age, name = 'Unknown', parent_permision = true)
    @id
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  # getters
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  # setters
  def set_id(value)
    @id = value
  end

  def set_name(value)
    @name = value
  end

  def can_use_services?
    return is_of_age? || @parent_permision
  end

  private

  def is_of_age?
    return @age >= 18
  end
end
