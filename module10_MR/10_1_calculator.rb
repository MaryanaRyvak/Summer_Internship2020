# 
# Калькулятор з такими можливостями:
# 1. додавання, віднімання, множення, ділення
# 2. додавання, віднімання з пам’яті і перегляд її стану
# 3. ланцюгування методів @calc.add(3).multiply(6) => 18
# 4. збереження актуального стану і зчитування його
# 5. можливість очищення актульного стану
# 
# Змінна калькулятора може бути ініціалізована певним значенням.
# Доступ до пам’яті та актуального результату здійснюється за допомогою
# ґеттерів відповідних полів об’єкту, а саме методів result та memory.
# 

class Calculator
  attr_reader :memory, :result

  def initialize number = 0
     @memory = 0
     @result = number
  end
  
  def add number
    @result += number
    self
  end
  def substract number
    @result -= number
    self
  end

  def multiply number
    @result *= number
    self
  end

  def divide number
    @result /= number
    self
  end

  def add_to_memory
    @memory += @result
    self
  end

  def substract_from_memory
    @memory -= @result
    self
  end

  def clear
    @result = 0
  end

end