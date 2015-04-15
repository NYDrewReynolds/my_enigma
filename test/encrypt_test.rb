# require 'minitest/autorun'
# require 'minitest'
# require 'minitest/pride'
# require './lib/encrypt.rb'
#
# class EncryptTest < Minitest::Test
#
#   def setup
#     key = Key.new("82648")
#     date = Date.new("030415")
#     ARGV[0] = "message.txt"
#     ARGV[1] = "encrypted.txt"
#     @mock_printer = MockPrinter.new
#     @encrypt = Encrypt.new(@mock_printer)
#     @encrypt.run
#   end
#
#   def test_it_encrypts_response_as_expected
#     assert_includes @mock_printer.things_printed, "Created 'encrypted.txt' with the key 82648 and date 030415"
#   end
#
#   def test_it_finds_file_message_txt
#     assert_equal "message.txt", @encrypt.file_to_read
#   end
#
#   def test_it_find_file_encrypted_txt
#     assert_equal "encrypted.txt", @encrypt.file_to_write
#   end
#
# end
#
# class MockPrinter
#   attr_reader :things_printed
#
#   def initialize
#     @things_printed = []
#   end
#
#   def puts(out)
#     @things_printed << out
#
#   end
#
# end