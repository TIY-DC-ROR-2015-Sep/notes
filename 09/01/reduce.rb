# sum
result = [1,2,3,4,5].reduce 0 do |accumulator, n|
  # puts "acc: #{accumulator} | n: #{n}"
  accumulator + n
end

puts "result is: #{result}"
puts

# find min
arr = [57, 205, 189, 54, 249, 133, 221, 59, 198, 64, 236, 135, 129, 209, 57, 189, 157, 129, 174, 144, 149, 97, 126, 138, 201, 233, 207, 234, 159, 131, 100, 154, 168, 23, 78, 167, 163, 104, 57, 191, 215, 86, 227 ]
min = arr.reduce do |min_so_far, next_val|
  # puts "min_so_far: #{min_so_far} | next_val: #{next_val}"
  if min_so_far < next_val
    min_so_far
  else
    next_val
  end
end

puts "min is: #{min}"
puts

max = arr.reduce do |max_so_far, next_val|
  # puts "max_so_far: #{max_so_far} | next_val: #{next_val}"
  if max_so_far > next_val
    max_so_far
  else
    next_val
  end
end

puts "max is: #{max}"
puts
# r = (1..10).to_a.map do |n|
#   puts "Now looking at #{n}"
#   n * n
# end
# puts "r: #{r}"

# words = %w( apple ball carrot delta )
words = File.read("/usr/share/dict/words").split("\n")
counts = words.reduce({}) do |acc, word|
  # puts "acc: #{acc} | word: #{word}"
  # if acc[word.length]
  #   acc[word.length] += 1
  # else
  #   acc[word.length] = 1
  # end
  acc[word.length] ||= 0
  acc[word.length]  += 1
  acc
end

count2 = words.each_with_object({}) do |word, h|
  h[word.length] ||= 0
  h[word.length]  += 1
end

puts "Final counts: #{counts} | #{count2} | #{counts == count2}"
puts

ns = (1..10).to_a
# ns.map { |n| n * 2 }
doubled = ns.reduce([]) do |acc, n|
  # puts "acc: #{acc} | n: #{n}"
  acc.push n * 2 # already returns `acc`
end

evens = ns.reduce([]) do |acc, n|
  # puts "acc: #{acc} | n: #{n}"
  # if n.even?
  #   acc.push n
  # end
  acc.push n if n.even? # n % 2 == 0
  acc
end

puts "Doubled: #{doubled} | evens: #{evens}"

# Group words by last letter
groups = words.reduce({}) do |hash_so_far, word|
  last_letter = word[-1]
  # puts "h: #{hash_so_far} | word: #{word} | #{last_letter}"
  if hash_so_far[last_letter] == nil
    hash_so_far[last_letter] = []
  end
  hash_so_far[last_letter].push word
  hash_so_far
end

xs = groups["x"]
puts "There are #{xs.count} words that end with x, like #{xs.sample(3)}"
