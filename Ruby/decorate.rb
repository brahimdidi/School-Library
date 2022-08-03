class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Base decorate class

class Decorator < Nameable
  def initialize(params)
    super()
    @nameable = params
  end

  def correct_name
    @nameable.correct_name
  end
end

# CapitalizeDecorator class

class CapitalizeDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.capitalize!
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    if name.length > 10
      name.strip
    else
      name
    end
  end
end
