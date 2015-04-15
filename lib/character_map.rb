class CharacterMap

  attr_reader :char_map

  def initialize
    @char_map = [*('a'..'z'), *('0'..'9'), ' ', '.', ',']
  end


end