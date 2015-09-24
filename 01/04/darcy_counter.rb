contents = File.read "./article.txt"
lines    = contents.split "\n"

puts "There are #{lines.count} lines"

counter = 0
lines.each do |current_line|
  if current_line.downcase.include? "darcy"
    counter = counter + 1
  end
end

puts "#{counter} lines contain 'darcy'"
