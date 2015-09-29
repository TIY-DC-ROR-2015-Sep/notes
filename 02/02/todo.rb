list = []

loop do
  puts "What do you want to do today?"
  puts "1) Show list"
  puts "2) Add item"
  puts "3) Exit program"

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
  elsif selection == 3
    puts "Have a nice day"
    break
  else
    puts "I don't know what to do with #{selection}"
  end

  puts
end
