list = []

loop do
  puts "What do you want to do today?"
  puts "1) Show list"
  puts "2) Add item"

  selection = gets.chomp.to_i
  if selection == 1
    # Do stuff to show list
    list.each do |todo|
      puts "* #{todo}"
    end
  elsif selection == 2
    # Add item
    puts "What do you need to do?"
    item = gets.chomp
    list.push item
  else
    # Say invalid
  end
end
