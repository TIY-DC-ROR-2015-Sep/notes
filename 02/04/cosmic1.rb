require 'pry'

words = File.read("words.txt").split("\n")

words_by_length = {}
words.each do |word|
  # word ~ apple
  # words_by_length[5].push "apple"

  # words_by_length[word.length] ||= []
  if words_by_length[word.length] == nil
    words_by_length[word.length] = []
  end

  words_by_length[word.length].push word
end



def works? w1, w2
  w1 != w2 && anagrams?(w1, w2) && chainable?(w1, w2)
end

def anagrams? w1, w2
  w1 == w2.chars.sort
end

def chainable? w1, w2
  w1[-1] == w2[0]
end

def find_pairs_from_list words
  counter = 0
  words.each do |fst|
    sorted_fst = fst.chars.sort

    words.each do |snd|
      if works?(sorted_fst, snd)
        counter += 1
        puts [fst, snd]
      end
    end
  end
  counter
end

sum = 0
words_by_length.each do |word_length, word_list|
  #puts "#{word_list.count} many words of length #{word_length}"
  count = find_pairs_from_list word_list
  sum += count
end

puts "There were #{sum} pairs that worked"
