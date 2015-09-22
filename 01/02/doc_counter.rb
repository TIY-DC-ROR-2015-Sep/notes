require 'pry'

puts "Type some text to analyze:"
print "> "
text = gets.chomp

# binding.pry
puts "Press 1 to count words, 2 to count characters"
selection = gets.chomp.to_i

# puts "You selected #{selection}"
# binding.pry

if selection == 1
  puts "That text had #{text.length} characters"
  puts "There are #{text.count 'e'} e's in that text"
else
  puts "There are #{text.split.count} words"
end
