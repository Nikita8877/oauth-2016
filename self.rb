class User
	class << self
		def my_class_meth # метод класса
			puts "hello from class method!"
		end
	end
	
	def show_name # instance method (метод образца класса)
		puts 'test name'
	end
end

#user = User.new # instance (образец класса)
#user.show_name

User.my_class_meth