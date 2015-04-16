require './lib/key.rb'
require './lib/date.rb'
require './lib/string_rotator.rb'
require './lib/offset_decrypt.rb'

class Decrypt

  def initialize(key, date, printer, file_to_read, file_to_write, instream)
    @key = key
    @date = date
    @printer = printer
    @offset = OffsetDecrypt.new(@key, @date)
    @file_to_read = file_to_read
    @file_to_write = file_to_write
    @instream = instream
  end

  def run
    contents = File.read(file_to_read).chomp
    decrypted_message = StringRotator.new(contents, @offset).decrypt

    file_name = file_to_write

    if File.exists?(file_to_write)
      puts "A file by the name of '#{file_to_write}' already exists. Are you sure you want to overwrite it? Yes/No"
      input = @instream.gets.chomp
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
    @file_to_read
  end

  def file_to_write
    @file_to_write
  end

end

Decrypt.new(
    ARGV[2],
    ARGV[3],
    $stdout,
    ARGV[0],
    ARGV[1],
    $stdin).run