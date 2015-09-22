numbers = (1..100).to_a

numbers.each do |number|
  if number % 3 == 0
    print "fizz, "
  elsif number % 5 == 0
    print "buzz, "
  else
    print "#{number}, "
  end
end
