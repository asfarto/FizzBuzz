class FizzBuzz
  def initialize(rules = [])
    @rules = rules
    load_default_rules
  end

  def play(input)
    response = execute_rules(input)
    response == '' ? input : response
  end

  def add_rule(rule)
    @rules << rule
  end

  private

  def load_default_rules
    { 3 => 'Fizz', 5 => 'Buzz', 7 => 'Pum', 23 => 'Banana' }.each do |k,v|
      @rules << DefaultRule.new(k,v)
    end
    {52 => 'Nike'}.each do |k,v|
      @rules << SponsorRule.new(k,v)
    end
    {5 => "Domino's"}.each do |k,v|
      @rules << DateRule.new(k,v)
    end
  end

  def execute_rules(input)
    response = ''
    @rules.each do |r|
      response = response + r.apply_rule(input)
    end
    response
  end
end

class DefaultRule

  def initialize(key, value)
    @key = key
    @value = value
  end

  def apply_rule(input)
    divisible?(input) ? @value : ''
  end

  private

  def divisible?(input)
    input % @key == 0
  end

end

class SponsorRule
  def initialize(key, value)
    @key = key
    @value = value
  end

  def apply_rule(input)
    @key == input ? @value : ''
  end
end

class DateRule
  def initialize(key, value)
    @key = key
    @value = value
  end

  def apply_rule(input)
    GameTime.today == @key ? input.to_s+@value : ''
  end
end

class GameTime
  def self.today
    Date.today.wday
  end
end
