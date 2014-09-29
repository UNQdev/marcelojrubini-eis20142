class FizzBuz
	def initialize()
	end

	def say(num)
		case num
		when 5
			print "Fizz"
		when 6
			print "Buzz"
		else print num + " is not valid option"
	end