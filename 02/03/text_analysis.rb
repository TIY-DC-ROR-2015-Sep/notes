require 'pry'


class Analyzer
  def initialize corpus
    @letters_array = []

    @alphabet = ('a'..'z').to_a
    26.times { @letters_array.push 0 }
    corpus.each_char do |c|
      i = @alphabet.index c
      if i
        @letters_array[i] += 1
      end
    end
  end

  def count letter
    i = @alphabet.index letter
    @letters_array[i]
  end
end

text = File.read "./words.txt"

a = Analyzer.new text

puts "There are #{a.count('e')} e's"
puts "There are #{a.count('t')} t's"
puts "There are #{a.count('z')} z's"
