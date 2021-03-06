class Date

  attr_reader :date, :squared, :date_code

  def initialize(date=nil)
    @date = date || Time.now.strftime("%d%m%y")
  end

  def square_date
    @squared = @date.to_i**2
  end

  def grab_last_four
    @date_code = square_date.to_s[-4..-1]
  end

end