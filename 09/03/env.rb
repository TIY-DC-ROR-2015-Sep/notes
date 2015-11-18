# Try:
# env
# MY_VARIABLE=2 ruby env.rb
# ruby env.rb MY_VARIABLE=2
# MY_VARIABLE=test ruby env.rb
# cat env.rb
# MY_VARIABLE=override ruby env.rb
# ruby env.rb

var = ENV["MY_VARIABLE"]

puts "var is #{var}"
