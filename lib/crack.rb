require './lib/key.rb'
require './lib/date.rb'
require './lib/string_rotator.rb'
require './lib/offset_decrypt.rb'
require './lib/key_cracker.rb'

class Crack

  def initialize(printer=nil)
    @date = ARGV[2]
    @printer = printer || $stdout
  end

  def run
    file = File.open(file_to_read, "r")
    contents = file.read.chomp
    cracked_key = KeyCracker.new(contents, @date).crack
    new_offset = OffsetDecrypt.new(cracked_key, @date)
    full_cracked_message = StringRotator.new(contents, new_offset).decrypt

    file_name = file_to_write

    if File.exists?(file_to_write)
      puts "A file by the name of '#{file_to_write}' already exists. Are you sure you want to overwrite it? Yes/No"
      input = $stdin.gets.chomp
      if input.downcase == "yes"
        decrypted_file = File.open(file_name, "w")
        decrypted_file.puts full_cracked_message
        decrypted_file.close
        @printer.puts "Created '#{file_to_write}' with the key #{cracked_key} and date #{@date}"
      else
        abort("Program canceled.")
      end
    else
      decrypted_file = File.open(file_name, "w")
      decrypted_file.puts full_cracked_message
      decrypted_file.close
      @printer.puts "Created '#{file_to_write}' with the key #{cracked_key} and date #{@date}"
    end
  end

  def file_to_read
    ARGV[0]
  end

  def file_to_write
    ARGV[1]
  end

end

Crack.new.run