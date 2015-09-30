require 'pry'


class Analyzer
  def initialize corpus
    @letters_hash = {}

    corpus.each_char do |ch|
      # @letters_hash[ch] = @letters_hash[ch] || 0
      # @letters_hash[ch] = @letters_hash[ch]  + 1
      @letters_hash[ch] ||= 0
      @letters_hash[ch]  += 1
    end

  end

  def count letter
    @letters_hash[letter]
  end
end

text = File.read "./words.txt"

a = Analyzer.new text
# binding.pry

puts "There are #{a.count('e')} e's"
puts "There are #{a.count('t')} t's"
puts "There are #{a.count('z')} z's"
