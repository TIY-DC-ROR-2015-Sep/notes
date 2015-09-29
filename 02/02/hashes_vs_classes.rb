require 'pry'

# -- Class --

class User
  def initialize first_name, last_name
    @first_name = first_name
    @last_name  = last_name
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

def store_full_name h
  h[:full_name] = h[:first_name] + " " + h[:last_name]
end

tom = User.new "Tom", "Crawford"
puts tom.first_name
puts tom.last_name

# -- Hash --

tom_hash = { first_name: "Tom", last_name: "Crawford" }
store_full_name(tom_hash)
puts tom_hash[:first_name]
puts tom_hash[:last_name]

# -- Updates --

tom_hash[:first_name] = "Thomas"
tom.first_name = "Thomas"
