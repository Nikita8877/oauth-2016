module MyMod
  def test_meth
    puts 'test'
  end

  def self.extended(klass)
    puts "#{self} extended!"
  end
end

class MyClass
  extend MyMod
end

obj = MyClass.new
MyClass.test_meth