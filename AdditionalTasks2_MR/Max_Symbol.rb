def max_symbol str
  symbols=[]
  max=0
  (0..str.length).each{|i|
    first=str.index(str[i])
    last=str.rindex(str[i])
    if last-first > max then
      symbols<< str[first]
    end
  }
end

puts("Enter string:")
str=gets.chomp
puts ("Result: #{max_symbol (str)}")
