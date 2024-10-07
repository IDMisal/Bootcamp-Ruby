require 'date'

def transform_age(age)
  age = age.to_i
  case age
  when 1..20
    "1->20"
  when 21..40
    "21->40"
  when 41..65
    "41->65"
  else
    "66->99"
  end
end

def transform_order_time(order_time)
  time = DateTime.parse(order_time)
  case time.hour
  when 6..11
    "morning"
  when 12..17
    "afternoon"
  else
    "evening"
  end
end

def my_data_transform(csv_content)
  lines = csv_content.split("\n")
  header = lines.shift 
  transformed_lines = [header] 

  lines.each do |line|
    columns = line.split(",")
    email_provider = columns[4].split("@")[1]
    age_group = transform_age(columns[5]) 
    order_time_group = transform_order_time(columns[9])
    columns[4] = email_provider
    columns[5] = age_group
    columns[9] = order_time_group
    transformed_lines << columns.join(",")
  end

  transformed_lines
end
=begin
csv_content = "Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At\nMale,Carl,Wilderman,carl,wilderman_carl@yahoo.com,29,Seattle,Safari iPhone,2,2020-03-06 16:37:56\nMale,Marvin,Lind,marvin,marvin_lind@hotmail.com,77,Detroit,Chrome Android,2,2020-03-02 13:55:51\nFemale,Shanelle,Marquardt,shanelle,marquardt.shanelle@hotmail.com,21,Las Vegas,Chrome,1,2020-03-05 17:53:05\nFemale,Lavonne,Romaguera,lavonne,romaguera.lavonne@yahoo.com,81,Seattle,Chrome,2,2020-03-04 10:33:53\nMale,Derick,McLaughlin,derick,mclaughlin.derick@hotmail.com,47,Chicago,Chrome Android,1,2020-03-05 15:19:48\n"
result = my_data_transform(csv_content)
result.each { |line| puts line }
=end