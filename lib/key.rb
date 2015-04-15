class Key

  attr_reader :key

  def initialize(key=nil)
    @key = key || generate
  end

  def generate
    (0...5).map { rand(9) }.join
  end

  def check_length_is_five
    @key.length == 5 ? true : false
  end

  def grab_rotation_a
    @key[0..1]
  end

  def grab_rotation_b
    @key[1..2]
  end

  def grab_rotation_c
    @key[2..3]
  end

  def grab_rotation_d
    @key[3..4]
  end

end