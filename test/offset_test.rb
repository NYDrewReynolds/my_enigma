require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/offset.rb'

class OffsetTest < Minitest::Test

  def setup
    key = Key.new("41521")
    date = Date.new("020315")
    @offset = Offset.new(key, date)
  end

  def test_it_exists
    assert Offset
  end

  def test_it_combines_a_values
    assert_equal 50, @offset.a
  end

  def test_it_combines_b_values
    assert_equal 17, @offset.b
  end

  def test_it_combines_c_values
    assert_equal 54, @offset.c
  end

  def test_it_combines_d_values
    assert_equal 26, @offset.d
  end
end
