require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/date.rb'

class DateTest < Minitest::Test
  def test_it_exists
    assert Date
  end

  def test_it_squares_one_number
    date = Date.new("2")
    assert_equal 4, date.square_date
  end

  def test_it_squares_two_numbers
    date = Date.new("10")
    assert_equal 100, date.square_date
  end

  def test_it_squares_and_grabs
    date = Date.new("020315")
    assert_equal "9225", date.grab_last_four
  end
end