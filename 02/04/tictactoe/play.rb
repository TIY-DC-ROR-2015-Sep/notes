puts "Welcome"

b = Board.new

until b.done?
  puts b.display
  puts "Player 1, what is your move?"
  move = gets.chomp
  b.record_move :x, move

  puts b.display
  puts "Player 2, what is your move?"
  move = gets.chomp
  b.record_move :o, move
end
