require "./lib/date.rb"
require "./lib/key.rb"

class Offset

  attr_reader :key, :date

  def initialize(key=nil, date=nil)
    @key = key || Key.new
    @date = date || Date.new
  end

  def a
   @key.grab_rotation_a.to_i + @date.grab_last_four[0].to_i
  end

  def b
    @key.grab_rotation_b.to_i + @date.grab_last_four[1].to_i
  end

  def c
    @key.grab_rotation_c.to_i + @date.grab_last_four[2].to_i
  end

  def d
    @key.grab_rotation_d.to_i + @date.grab_last_four[3].to_i
  end

end