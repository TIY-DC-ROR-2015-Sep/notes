require 'pry'
require 'json'


class TodoManager
  attr_reader :list
  # def list
  #   @list
  # end

  def initialize list
    @list = list
  end

  def show_list
    # Do stuff to show list
    list.each do |todo|
      if todo["done"]
        puts "X #{todo['description']}"
      else
        puts "- #{todo['description']}"
      end
    end
  end

  def add_item
    # Add item
    puts "What do you need to do?"
    description = gets.chomp
    item = { "description" => description, "done" => false }
    list.push item
  end

  def save_and_quit
    File.write "database", list.to_json
    puts "Have a nice day"
    exit
  end

  def mark_item_complete
    puts "What did you do?"
    number = 1
    list.each do |todo|
      description = todo["description"]
      puts "#{number}) #{description}"
      number = number + 1
    end
    selected_number = gets.chomp.to_i
    selected_todo = list[selected_number - 1]
    puts "Good job doing #{selected_todo['description']}!"
    selected_todo["done"] = true
  end
end

list = JSON.parse File.read("database")
tm = TodoManager.new list

loop do
  puts "What do you want to do today?"
  puts "1) Show list"
  puts "2) Add item"
  puts "3) Exit program"
  puts "4) Mark item as done"

  selection = gets.chomp.to_i
  if selection == 1
    tm.show_list
  elsif selection == 2
    tm.add_item
  elsif selection == 3
    tm.save_and_quit
  elsif selection == 4
    tm.mark_item_complete
  else
    puts "I don't know what to do with #{selection}"
  end

  puts
end
