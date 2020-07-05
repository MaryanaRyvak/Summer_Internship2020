# Кожна планета має свій номер (порядок від Сонця).
# За заданим значенням номера повернути назва планети.
def planet number
  case number
    when 1 then 'Mercury'
    when 2 then 'Venus'
    when 3 then 'Earth'
    when 4 then 'Mars'
    when 5 then 'Jupiter'
    when 6 then 'Saturn'
    when 7 then 'Uranus'
    when 8 then 'Neptune'
  else puts 'Wrong number of planet'
        abort
  end
end

puts ('Enter num planet : ')
number = gets.chomp.to_i
puts "It's #{planet number}"
