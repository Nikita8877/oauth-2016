local_var = 'test'

define_method :test_meth do
  puts local_var
end

test_meth

class MyClass
  attr_reader :my_var
  def initialize(my_var)
    @my_var = my_var
  end
end

obj = MyClass.new('string')
obj.instance_exec do
  @my_var = 'new value'
end

puts obj.my_var