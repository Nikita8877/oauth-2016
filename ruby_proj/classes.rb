class Animal
  attr_accessor :name

  def initialize(name = 'temp name')
    @name = name
  end

  def say(text)
    puts text
  end
end

class Dog < Animal
  def say
    super 'bark!'
  end
end

class Cat < Animal
  def say
    super 'meow'
  end
end

dog = Dog.new('test dog')
dog2 = Dog.new('test dog 2')