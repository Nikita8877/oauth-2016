class MyClass
  def MyClass.class_method

  end
end

puts MyClass.singleton_methods.inspect

str = 'test'

def str.singleton_method_added(meth_name)
  puts "method added! #{meth_name}"
end

def str.my_meth
  puts 'hi'
end

puts str.singleton_methods.inspect