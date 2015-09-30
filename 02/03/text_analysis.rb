require 'pry'


class Analyzer
  def initialize corpus
    @corpus = corpus
  end

  def count letter
    acc = 0
    @corpus.each_char do |c|
      if c == letter
        acc += 1
      end
    end
    acc
  end
end

text = File.read "./words.txt"

a = Analyzer.new text
# binding.pry
puts "There are #{a.count('e')} e's"
puts "There are #{a.count('t')} t's"
puts "There are #{a.count('z')} z's"
