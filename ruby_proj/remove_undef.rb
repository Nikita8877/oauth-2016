class Parent
  def another_method_to_undef
    puts 'test meth from Parent (undef)'
  end

  def test_meth
    puts 'test meth from Parent'
  end
end

class MyClass < Parent
  def self.method_removed(method_name)
    puts "Removing #{method_name.inspect}"
  end

  def self.method_undefined(method_name)
    puts "Undef #{method_name.inspect}"
  end

  def test_meth
    puts 'test meth from MyClass'
  end

  def another_method_to_undef
    puts 'test meth from MyClass (undef)'
  end
end

obj = MyClass.new
MyClass.class_exec do
  remove_method :test_meth
  undef_method :another_method_to_undef
end

puts obj.private_methods.inspect

