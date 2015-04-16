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

  def test_it_squares_two_same_numbers
    date = Date.new("11")
    assert_equal 121, date.square_date
  end

  def test_it_squares_four_digit_numbers
    date = Date.new("4567")
    assert_equal 20857489, date.square_date
  end

  def test_it_squares_six_digit_numbers
    date = Date.new("020315")
    assert_equal 412699225, date.square_date
  end

  def test_it_squares_six_digit_numbers_with_zeros
    date = Date.new("000005")
    assert_equal 25, date.square_date
  end

  def test_it_squares_and_grabs
    date = Date.new("020315")
    assert_equal "9225", date.grab_last_four
  end

  def test_it_wont_grab_less_than_four
    date = Date.new("10")
    assert_equal nil, date.grab_last_four
  end

  def test_it_can_grab_only_four
    date = Date.new("100")
    assert_equal "0000", date.grab_last_four
  end
end