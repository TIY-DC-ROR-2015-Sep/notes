puts "What do you want to do today?"
puts "1) Show list"
puts "2) Add item"

selection = gets.chomp.to_i
if selection == 1
  # Do stuff to show list
elsif selection == 2
  # Add item
else
  # Say invalid
end
