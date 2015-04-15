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

end
