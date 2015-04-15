require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/rotator.rb'

class RotatorTest < Minitest::Test
  def test_it_exists
    assert Rotator
  end

  def test_it_finds_index_of_a
    find = Rotator.new(["a"])
    assert_equal [0], find.find_index
  end

  def test_it_finds_last_index
    find = Rotator.new([","])
    assert_equal [38], find.find_index
  end

  def test_it_finds_index_of_two_chars
    find = Rotator.new(["a", "b"])
    assert_equal [0, 1], find.find_index
  end

  def test_it_finds_index_of_four_characters
    find = Rotator.new(["a", "b", ",", "."])
    assert_equal [0, 1, 38, 37], find.find_index
  end

  def test_it_rotates_forward
    rotate = Rotator.new(["a"]).find_index
    assert_equal "b", rotate.rotate_forward(1)
  end

  def test_it_rotates_2_letters
    skip
    rotate = Rotator.new(["a","b"])
    rotate.find_index
    assert_equal "bc", rotate.rotate_forward(1)
  end
end
