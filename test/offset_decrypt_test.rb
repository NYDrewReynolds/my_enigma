require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/offset_decrypt.rb'

class OffsetDecryptTest < Minitest::Test

  def setup
    key = Key.new("41521").key
    date = Date.new("020315").date
    @offset = OffsetDecrypt.new(key, date)
  end

  def test_it_exists
    assert OffsetDecrypt
  end

  def test_it_combines_a_values
    assert_equal 50, @offset.a
  end

  def test_it_can_be_wrong_a
    refute_equal 40, @offset.a
  end

  def test_it_combines_b_values
    assert_equal 17, @offset.b
  end

  def test_it_can_be_wrong_b
    refute_equal 3, @offset.b
  end

  def test_it_combines_c_values
    assert_equal 54, @offset.c
  end

  def test_it_can_be_wrong_c
    refute_equal 90, @offset.c
  end

  def test_it_combines_d_values
    assert_equal 26, @offset.d
  end

  def test_it_can_be_wrong_d
    refute_equal 55, @offset.d
  end
end
