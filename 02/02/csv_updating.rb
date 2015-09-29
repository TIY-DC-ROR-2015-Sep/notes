require 'csv'
require 'pry'

# Read input
all_rows = []
CSV.foreach "./example.csv" do |row|
  all_rows.push row
end
# all_rows => [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

# Let's update something ...
all_rows[1][1] = "X"
# all_rows => [["1", "2", "3"], ["4", "X", "6"], ["7", "8", "9"]]

# ... and save the updates
# For your example, this would probably over-write the
#   "database" file
CSV.open "./example-output.csv", "wb" do |csv|
  all_rows.each do |row|
    # This formats the row as csv and prints it to the file
    csv << row
  end
end

# Now compare `example.csv` and `example-output.csv`
