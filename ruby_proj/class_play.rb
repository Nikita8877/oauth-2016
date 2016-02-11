module HowModule
  def how
    puts "how are you?"
  end
end

class Hello
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say(text)
    puts text
  end
end

class Hi < Hello
  include HowModule
  def privet
    puts "hello!"
  end

  def say
    super("good morning")
  end
end

class Buy < Hello
  include HowModule
  def buy
    puts "goodbuy"
  end
end



hello = Hello.new("Piter")
hi = Hi.new("David")
puts hi.name
puts hi.privet
hi.say
puts hi.how
