require 'test/unit'
require_relative '../model/fizz_buzz'

class FizzBuzzTest < Test::Unit::TestCase

  def fizz_buzz
    FizzBuzz.new
  end

  def test_should_return_fizz_for_5
    assert_equal("Fizz", fizz_buzz.say(5))
  end

  def test_should_return_buzz_for_6
    assert_equal("Buzz", fizz_buzz.say(6))
  end

end