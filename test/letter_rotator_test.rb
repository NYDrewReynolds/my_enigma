require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/letter_rotator.rb'

class LetterRotatorTest < Minitest::Test

  def setup
    @offset = 1
  end

  def test_it_exists
    assert LetterRotator
  end

  def test_it_finds_index_of_a
    rotator = LetterRotator.new("a", @offset)
    assert_equal 0, rotator.find_index
  end

  def test_it_finds_last_index
    rotator = LetterRotator.new(",", @offset)
    assert_equal 38, rotator.find_index
  end

  def test_it_finds_spaces
    rotator = LetterRotator.new(" ", @offset)
    assert_equal 36, rotator.find_index
  end

  def test_it_offsets_by_1
    rotator = LetterRotator.new("a", @offset)
    assert_equal "b", rotator.rotate_forward
  end

  def test_it_can_offset_space
    rotator = LetterRotator.new(" ", @offset)
    assert_equal ".", rotator.rotate_forward
  end

  def test_it_can_offset_by_5
    rotator = LetterRotator.new("b", 5)
    assert_equal "g", rotator.rotate_forward
  end

  def test_it_can_rotate_backward
    rotator = LetterRotator.new("b",1)
    assert_equal "a", rotator.rotate_backward
  end

  def test_it_can_rotate_backward_by_ten
    rotator = LetterRotator.new("p", 10)
    assert_equal "f", rotator.rotate_backward
  end

  def test_it_can_rotate_backward_from_a
    rotator = LetterRotator.new("a", 10)
    assert_equal "3", rotator.rotate_backward
  end
end
