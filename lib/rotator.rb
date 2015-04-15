require "./lib/character_map.rb"
require "./lib/combine.rb"

class Rotator

  attr_reader :current_index

  def initialize(letters)
    @full_char_map = CharacterMap.new.char_map
    @letters = letters
  end

  def find_index
    @current_index = @letters.map do |single_letter|
      @full_char_map.index(single_letter)
    end
  end

  def rotate_forward(number)
    @current_index = (@current_index.join + number) % 39
    @full_char_map[@current_index]
  end

  def rotate_backward(number)
    @current_index = (@current_index - number) % 39
    @full_char_map[@current_index]
  end

  # split string every 4 indexes
  # Rotate first letter along char_map by a_total
  # Rotate second letter along char_map by b_total
  # Rotate third letter along char_map by c_total
  # Rotate fourth letter along char_map by d_total
end