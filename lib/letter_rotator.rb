require "./lib/character_map.rb"
require "./lib/offset.rb"
# require 'pry'

class LetterRotator

  attr_reader :current_index

  def initialize(letter, offset)
    @full_char_map = CharacterMap.new.char_map
    @letter = letter
    @offset = offset
  end

  def find_index
    @full_char_map.index(@letter)
  end

  def rotate_forward
    @full_char_map[(find_index + @offset) % 39]
  end

  def rotate_backward
    @full_char_map[(find_index - @offset) % 39]
  end
end