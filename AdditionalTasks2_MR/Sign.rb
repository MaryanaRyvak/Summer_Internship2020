def isPositive num
  num >= 0
end
def sign arr
  if arr.length < 1
    return 0
  elsif arr.length == 1
    return 1
  end
  count_change = 0
  
  (0...(arr.length-1)).each{|i|
    if isPositive(arr[i].to_i) != isPositive(arr[i+1].to_i)
      count_change += 1
    end
  }
  count_change
end

puts("Enter array of numbers:")
arr=gets.chomp.split(" ")
puts ("Quantity of sigh changes = #{sign (arr)}")
