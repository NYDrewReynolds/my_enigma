require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require './lib/character_map.rb'

class CharacterMapTest < Minitest::Test
  def test_it_exists
    assert CharacterMap
  end

end