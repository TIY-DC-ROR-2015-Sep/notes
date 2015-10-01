words = File.read("words.txt").split("\n")

def works? w1, w2
  anagrams?(w1, w2) && chainable?(w1, w2)
end

def anagrams? w1, w2
  w1.chars.sort == w2.chars.sort
end

def chainable? w1, w2
  w1[-1] == w2[0]
end

counter = 0
words.each do |fst|
  words.each do |snd|
    if works?(fst, snd)
      counter += 1
      puts [fst, snd]
    end
  end
end

puts "There were #{counter} pairs that worked"
