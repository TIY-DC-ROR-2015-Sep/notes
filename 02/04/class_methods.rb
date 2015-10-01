class Person
  attr_reader :first_name, :last_name

  # def Person.by_name
  def self.by_name full_name
    first, last = full_name.split " "
    Person.new first, last
  end

  class << self
    def wat
      puts "This is also a class method"
    end
  end

  def initialize first, last
    @first_name = first
    @last_name  = last
  end

  def say_hello!
    system "say 'Hi, my name is #{name}'"
  end

  def name
    first_name + " " + last_name
  end
end

tom = Person.new "Tom", "Crawford"
su  = Person.new "Su", "Kim"

require 'pry'
binding.pry
