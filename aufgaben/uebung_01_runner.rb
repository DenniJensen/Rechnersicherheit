#/usr/bin/env ruby
require_relative './ceasar_crypter'

puts 'Hello, this is a simple ceasar encrypter'

def key_by_user
  puts 'What is the key for De/Encrypt'
  gets.to_i
end

def text_by_user
  puts 'Type word o text to excrypt'
  puts 'Please just type words (no integers)'
  gets
end

ceasar_enrypter = CeasarCrypter.new key_by_user

while(true) do
  puts ceasar_enrypter.decrypt(text_by_user)
  puts
end
