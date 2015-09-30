require 'pry'


class Analyzer
  def initialize corpus
    @letters_hash = {}

    corpus.each_char do |c|
      if @letters_hash[c] == nil
        @letters_hash[c] = 0
      end
      @letters_hash[c] = @letters_hash[c] + 1
    end

  end

  def count letter
    @letters_hash[letter]
  end
end

text = File.read "./words.txt"

a = Analyzer.new text

puts "There are #{a.count('e')} e's"
puts "There are #{a.count('t')} t's"
puts "There are #{a.count('z')} z's"
