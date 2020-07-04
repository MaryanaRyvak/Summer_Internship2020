def quarter month
  result= case month.to_i
          when 1..3 then "First quarter"
          when 4..6 then "Second quarter"
          when 7..9 then "Third quarter"
          when 10..12 then "Fourth quarter"
          else
            "Incorrect number of month!"
          end
end

  puts "Enter number of month:"
  month = gets.chomp
  puts quarter month
