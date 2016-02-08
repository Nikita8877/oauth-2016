def top_method
  yield
end

def my_meth(a)
  top_method(block)
  #yield(a) if block_given?
  puts 'end of method'
end

my_meth('my message') { |msg| puts msg }