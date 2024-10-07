def my_string_index(haystack,needle)
    arr = haystack.split("")
    for i in 0...arr.length
        if arr[i] == needle
            return i
        end
    end
    return -1
end
#puts my_string_index("ismail","l")