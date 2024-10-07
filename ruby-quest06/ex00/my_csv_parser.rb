def my_csv_parser(csv_string, separator)
   
    lines = csv_string.split("\n")
    data = []
    lines.each do |line|
      row = line.split(separator)
      data.append(row)
    end

    return data
  end
  
#print my_csv_parser("a,b,c,e\n1,2,3,4\n" , ",")