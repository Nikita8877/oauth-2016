class User
	class << self
		def my_class_meth # ����� ������
			puts "hello from class method!"
		end
	end
	
	def show_name # instance method (����� ������� ������)
		puts 'test name'
	end
end

#user = User.new # instance (������� ������)
#user.show_name

User.my_class_meth