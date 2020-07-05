#Порахувати, скільки грошей буде заощаджено.
# Дано три цілих: ціна товару, знижка (у відсотках)
# за одиницю товару, кількість товару.
# Повернути: заощаджену суму (ціле число, заокруглити, якщо потрібно)
def saved_money numbers
  price = numbers[0].to_f
  discount = numbers[1].to_f
  quantity = numbers[2].to_f

  saved_sum = ((price * discount) / 100) * quantity
end

puts "Enter price of the product, discount and quantity"
numbers = gets.chomp.split(" ")
puts "Saved sum = #{saved_money(numbers).round}"

