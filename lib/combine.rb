require "./lib/date.rb"
require "./lib/key.rb"

class Combine

  attr_reader :key, :date

  def initialize
    @key = Key.new("41521")
    @date = Date.new("020315")
  end

  def combined_a
   a_total = @key.grab_rotation_a.to_i + @date.grab_last_four[0].to_i
  end

  def combined_b
    b_total = @key.grab_rotation_b.to_i + @date.grab_last_four[1].to_i
  end

  def combined_c
    c_total = @key.grab_rotation_c.to_i + @date.grab_last_four[2].to_i
  end

  def combined_d
    d_total = @key.grab_rotation_d.to_i + @date.grab_last_four[3].to_i
  end

end