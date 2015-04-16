require './lib/offset.rb'
require './lib/letter_rotator.rb'

class StringRotator

  def initialize(original, offset)
    @original = original.downcase
    @offset = offset
  end

  def encrypt
    @original.chars.map.with_index do |character, index|
      letter = LetterRotator.new(character, pick_offset[index%4])
      letter.rotate_forward
    end.join
  end

  def decrypt
    @original.chars.map.with_index do |character, index|
      letter = LetterRotator.new(character, pick_offset[index%4])
      letter.rotate_backward
    end.join
  end

  def pick_offset
    [@offset.a,@offset.b,@offset.c,@offset.d]
  end
end