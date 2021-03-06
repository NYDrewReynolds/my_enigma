class KeyCracker

  attr_reader :date, :key, :message, :cracked

  def initialize(message, date)
    @date = date
    @key = 0
    @message = message
    @cracked = false
  end

  def crack
    until cracked
      new_offset = OffsetDecrypt.new(@key.to_s.rjust(5,"0"), @date)
      full_cracked_message = StringRotator.new(@message, new_offset).decrypt

      if full_cracked_message[-7..-1] == "..end.."
        @cracked = true
      elsif @key == 99999
        abort("Incorrect encrypted message or date.")
      else
        @key += 1
      end
    end
    @key.to_s
  end
end