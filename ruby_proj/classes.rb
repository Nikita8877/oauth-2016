class Animal
  include Comparable
  attr_accessor :name, :weight

  def initialize(name = 'temp name', weight = 0)
    @name = name
    @weight = weight
  end

  def <=>(other_object)
    self.weight <=> other_object.weight
  end

  def say(text)
    puts text
  end

  private

  def my_hidden_method
    puts 'hidden!'
  end
end

class Dog < Animal
  def say
    my_hidden_method
    super 'bark!'
  end
end

class Cat < Animal
  def say
    super 'meow'
  end
end

dog = Dog.new('test dog', 10)
dog2 = Dog.new('test dog 2', 15)