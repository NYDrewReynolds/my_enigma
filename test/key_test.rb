require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/key.rb'

class KeyTest < Minitest::Test
  def test_it_exists
    assert Key
  end

  def test_it_is_5_digits_long
    key = Key.new("12345")
    assert true, key.check_length_is_five
  end

  def test_it_grabs_first_two_digits
    key = Key.new("41521")
    assert_equal "41", key.grab_rotation_a
  end

  def test_it_grabs_second_two_digits
    key = Key.new("41521")
    assert_equal "15", key.grab_rotation_b
  end

  def test_it_grabs_third_two_digits
    key = Key.new("41521")
    assert_equal "52", key.grab_rotation_c
  end

  def test_it_grabs_last_two_digits
    key = Key.new("41521")
    assert_equal "21", key.grab_rotation_d
  end

  def test_it_works_if_starting_with_zero
    key = Key.new("01275")
    assert_equal "01", key.grab_rotation_a
  end
end