class PrimeGenerator
	#def initialize()
	#end

	def is_prime(num)
		num == 1 || num == 0 ? false : !(2..num - 1).to_a.detect { |i| num % i == 0 }
	end

	def all_primes_to(top)
		i = 1
		primes = []
		while i < top do
			if is_prime(i)
				primes << i
			end
			i+=1
		end
		primes
	end

end