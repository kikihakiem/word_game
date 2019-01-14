#!/usr/bin/env ruby

require_relative '../lib/word_game'
require_relative '../lib/console_input'
require_relative '../lib/word_collection'

input = ConsoleInput.new
words = []
File.foreach('words.txt') do |word|
    words << word.chomp
end
wg = WordGame.new(WordCollection.new(words), input)
final_score = wg.play

puts "Point akhir anda: #{final_score}"
