require "./board"

puts "Welcome"

b = Board.new

until b.done?
  b.display
  puts "Player X, what is your move?"
  move = gets.chomp
  b.record_move :x, move
  puts

  break if b.done?

  b.display
  puts "Player O, what is your move?"
  move = gets.chomp
  b.record_move :o, move
  puts
end

puts
puts

b.display
if b.won?
  puts "Somebody won!"
else
  puts "It's a draw"
end
