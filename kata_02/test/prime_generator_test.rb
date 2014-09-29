# prime_generator_test.rb

require 'test/unit'
require_relative '../model/prime_generator'

class PrimeGeneratorTest < Test::Unit::TestCase

	def setup
		@generator = PrimeGenerator.new
	end

	def test_is_prime_should_return_false_for_10
		assert !@generator.is_prime(10)
	end

	def test_is_prime_should_return_false_for_5
		assert @generator.is_prime(5)
	end

	def test_all_primes_to_10_should_return_4_items
		primes = @generator.all_primes_to(10)
		assert_equal 4, primes.size
	end

	def test_all_primes_to_10_should_include_2
	primes = @generator.all_primes_to(10)
	assert primes.include?(2)
	end

end