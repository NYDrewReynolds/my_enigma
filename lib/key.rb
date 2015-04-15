class Key

  attr_reader :key, :rotation_a, :rotation_b, :rotation_c, :rotation_d

  def initialize(key)
    @key = key
  end

  def check_length_is_five
    @key.length == 5 ? true : false
  end

  def grab_rotation_a
    @rotation_a = @key[0..1]
  end

  def grab_rotation_b
    @rotation_b = @key[1..2]
  end

  def grab_rotation_c
    @rotation_c = @key[2..3]
  end

  def grab_rotation_d
    @rotation_d = @key[3..4]
  end

  # def generate
  #   (0...5).map {rand(9) }.join
  # end
end

