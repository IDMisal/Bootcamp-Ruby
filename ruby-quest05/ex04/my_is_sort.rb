def my_is_sort(arr)
    sorted_arr_ascending = arr.sort
    sorted_arr_decending = arr.reverse
    if sorted_arr_ascending == arr || sorted_arr_ascending == sorted_arr_decending
      return true
    else
      return false
    end
  end
  
=begin 
  puts my_is_sort([1, 2, 3, 4, 5]) 
  puts my_is_sort([5, 4, 3, 2, 1])  
  puts my_is_sort([1, 3, 2, 4, 5])  
  puts my_is_sort([5, 2, 7, 3, 1])  
=end