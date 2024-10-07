require 'json'

def my_data_process(data)
  header = data.shift.split(",") # Extract header and remove it from data
  columns_to_discard = ["FirstName", "LastName", "UserName", "Coffee Quantity"]
  columns = header.reject { |column| columns_to_discard.include?(column) } # Get columns to process

  counts = columns.each_with_object({}) do |column, result|
    column_index = header.index(column)
    column_data = data.map { |line| line.split(",")[column_index] } # Extract data for current column
    result[column] = column_data.group_by(&:itself).transform_values(&:count) # Group and count occurrences
  end

  counts.to_json # Convert counts hash to JSON string
end
=begin
data = [
  "Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At",
  "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon",
  "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon",
  "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon",
  "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning",
  "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"
]

result = my_data_process(data)
puts result
=end