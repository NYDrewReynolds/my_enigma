require './lib/key.rb'
require './lib/date.rb'
require './lib/string_rotator.rb'
require './lib/offset_decrypt.rb'

class Decrypt

  def initialize(printer=nil)
    @key = ARGV[2]
    @date = ARGV[3]
    @printer = printer || $stdout
    @offset = OffsetDecrypt.new(@key, @date)
  end

  def run
    file = File.open(file_to_read, "r")
    contents = file.read.chomp
    decrypted_message = StringRotator.new(contents, @offset).decrypt

    file_name = file_to_write

    if File.exists?(file_to_write)
      puts "A file by the name of '#{file_to_write}' already exists. Are you sure you want to overwrite it? Yes/No"
      input = $stdin.gets.chomp
      if input.downcase == "yes"
        decrypted_file = File.open(file_name, "w")
        decrypted_file.puts decrypted_message
        decrypted_file.close
        @printer.puts "Created '#{file_to_write}' with the key #{@key} and date #{@date}"
      else
        abort("Program canceled.")
      end
    else
      decrypted_file = File.open(file_name, "w")
      decrypted_file.puts decrypted_message
      decrypted_file.close
      @printer.puts "Created '#{file_to_write}' with the key #{@key} and date #{@date}"
    end
  end


  def file_to_read
    ARGV[0]
  end

  def file_to_write
    ARGV[1]
  end

end

Decrypt.new.run