require './lib/key.rb'
require './lib/date.rb'
require './lib/string_rotator.rb'
require './lib/offset.rb'

class Encrypt

  def initialize(printer=nil, key=nil, date=nil)
    @key = key || Key.new
    @date = date || Date.new
    @printer = printer || $stdout
    @offset = Offset.new(@key, @date)
  end

  def run
    file = File.open(file_to_read, "r")
    contents = file.read
    encrypted_message = StringRotator.new(contents, @offset).encrypt

    file_name = file_to_write
    encrypted_file = File.open(file_name, "w")
    encrypted_file.puts encrypted_message
    encrypted_file.close

    @printer.puts "Created '#{file_to_write}' with the key #{@key.key} and date #{@date.date}"
  end

  def file_to_read
    ARGV[0]
  end

  def file_to_write
    ARGV[1]
  end

end

Encrypt.new.run