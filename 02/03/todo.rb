require 'date'
require 'pry'
require 'json'

class TodoItem
  attr_reader :description, :done, :due_at

  def initialize h
    @description = h["description"]
    @done        = h["done"]

    if h["due_at"]
      @due_at = Date.parse(h["due_at"])
    else
      @due_at = nil
    end
  end

  def past_due?
    due_at && Date.today > due_at
  end

  def bullet_icon
    if done
      "X"
    elsif past_due?
      "!"
    else
      "-"
    end
  end

  def due_label
    if due_at
      "(#{due_at})"
    else
      ""
    end
  end

  def format
    "#{bullet_icon} #{description} #{due_label}"
  end
end

class TodoManager
  attr_reader :list
  # def list
  #   @list
  # end

  def initialize list
    @list = list
  end

  def show_list
    list.each do |todo|
      puts todo.format
    end
  end

  def ask? prompt
    puts "#{prompt}? (y/n)"
    answer = gets.chomp
    case answer.downcase
    when "y", "yes", "true", "ok", "okay"
      true
    when "n", "no", "false", "nope"
      false
    else
      puts "Don't know what #{answer} means."
      ask? prompt
    end
  end

  def add_item
    # Add item
    puts "What do you need to do?"
    description = gets.chomp
    yes = ask? "Do you want to set due date"
    if yes
      puts "When is this due?"
      due_date = gets.chomp
    end
    item = {
      "description" => description,
      "done"        => false,
      "due_at"      => due_date
    }
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

list_of_hashes = JSON.parse File.read("database")
list = []
list_of_hashes.each do |h|
  list.push TodoItem.new(h)
end
binding.pry
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
