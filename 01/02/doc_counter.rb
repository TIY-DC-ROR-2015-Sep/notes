require 'pry'

class Analyzer
  def initialize text
    @text = text
  end

  def word_count
    @text.split.count
  end

  def character_count
    @text.length
  end

  def e_count
    @text.count 'e'
  end
end


puts "Type some text to analyze:"
print "> "
text = gets.chomp
a = Analyzer.new text

# binding.pry
puts "Press 1 to count words, 2 to count characters"
selection = gets.chomp.to_i

# puts "You selected #{selection}"
# binding.pry

if selection == 1
  puts "That text had #{a.character_count} characters"
  puts "There are #{a.e_count} e's in that text"
else
  puts "There are #{a.word_count} words"
end
