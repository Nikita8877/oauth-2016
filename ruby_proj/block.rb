def top_method(message, &block)
  block.call(message)
end

def my_meth(a, &block)
  top_method(a, &block)
  #yield(a) if block_given?
  #puts 'end of method'
end

my_meth('my message') { |msg| puts msg }

def test_method
  @a = ''
  my_proc = -> do
    @a = 'test'
    return 'test'
  end
  my_proc.call
  puts @a
end

#puts test_method


# my_proc = Proc.new { puts 'hi' }
#my_lambda = -> { puts 'hi from lambda' }
#puts my_lambda.class
#
# my_proc.call('test')
# my_lambda.call('test')