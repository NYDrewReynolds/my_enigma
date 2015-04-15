require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/combine.rb'

class CombineTest < Minitest::Test
  def test_it_exists
    assert Combine
  end

  def test_it_combines_a_values
    key = Key.new("41521")
    date = Date.new("020315")
    add = Combine.new
    assert_equal 50, add.combined_a
  end

  def test_it_combines_b_values
    key = Key.new("41521")
    date = Date.new("020315")
    add = Combine.new
    assert_equal 17, add.combined_b
  end

  def test_it_combines_c_values
    key = Key.new("41521")
    date = Date.new("020315")
    add = Combine.new
    assert_equal 54, add.combined_c
  end

  def test_it_combines_d_values
    key = Key.new("41521")
    date = Date.new("020315")
    add = Combine.new
    assert_equal 26, add.combined_d
  end
end
