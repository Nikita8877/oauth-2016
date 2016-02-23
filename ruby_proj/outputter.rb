module Outputter
  def self.included(klass)
    klass.class_exec do
      define_method(:render) do |key, values = {}|
        return unless klass::MESSAGES.has_key?(key)
        msg = klass::MESSAGES[key]
        values.each do |k, v|
          msg.gsub!(Regexp.new('{{' + k.to_s + '}}'), v.to_s)
        end
        puts msg
      end
    end
  end
end

class MyClass
  MESSAGES = {
      number: 'The number is {{value}}, some other data {{other_data}}',
      other_number: 'Another number {{value}}'
  }
  include Outputter
end

class OtherClass
  MESSAGES = {
      for_other_class: 'Another class!'
  }
  include Outputter
end

my_obj = MyClass.new
my_obj.render(:number, value: 10, other_data: 50)
my_obj.render(:other_number, value: 10)

other_obj = OtherClass.new
other_obj.render(:for_other_class)