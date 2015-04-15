require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/string_rotator.rb'


class StringRotatorTest < Minitest::Test

  def setup
    key = Key.new("41521")
    date = Date.new("020315")
    @offset = Offset.new(key, date)
  end

  def test_it_converts_one_letter_string
    message = StringRotator.new("a", @offset)
    assert_equal "l", message.encrypt
  end

  def test_it_converts_another_letter
    message = StringRotator.new("2", @offset)
    assert_equal "a", message.encrypt
  end

  def test_it_converts_two_characters
    message = StringRotator.new("aa", @offset)
    assert_equal "lr", message.encrypt
  end

  def test_it_converts_four_characters
    message = StringRotator.new("try ", @offset)
    assert_equal "48ax", message.encrypt
  end

  def test_it_converts_a_sentence
    message = StringRotator.new("aaaaaaaa", @offset)
    assert_equal "lrp0lrp0", message.encrypt
  end
end
