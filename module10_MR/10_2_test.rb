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
# Всі вимоги є зображеними нище у вигляді тестів.
# Вашим завданням є побудова класу Calculator.

require "test/unit"
require_relative "10_1_calculator"

class CalculatorTest < Test::Unit::TestCase

  INIT_CONST = 10
  OTHER_CONST = 2
  KURIN = 73

  def setup
    @calc = Calculator.new
    @icalc = Calculator.new INIT_CONST
  end

  def test_created?
    assert(@calc, "Об’єкт калькулятора не був створеним")
  end

  def test_initial
    actual = @calc.result
    expected = 0
    assert(actual == expected, "Початковий стан об’єкта не рівний нулю")
  end

  def test_initial_with_param
    actual = @icalc.result
    expected = INIT_CONST
    assert(actual == expected, "Початковий стан об’єкта не рівний нулю")
  end

  def test_add
    actual = @calc.add(KURIN).result
    expected = KURIN
    assert(actual === expected, "Не правильно виконано операцію додавання")
  end

  def test_substract
    actual = @calc.substract(KURIN).result
    expected = -KURIN
    assert(actual === expected, "Не правильно виконано операцію віднімання")
  end

  def test_multiply
    actual = @icalc.multiply(OTHER_CONST).result
    expected = INIT_CONST * OTHER_CONST
    assert(actual === expected, "Не правильно виконано операцію множення")
  end

  def test_divide
    actual = @icalc.divide(OTHER_CONST).result
    expected = INIT_CONST / OTHER_CONST
    assert(actual === expected, "Не правильно виконано операцію ділення")
  end

  def test_chaining_add
    actual = @icalc.add(KURIN).substract(INIT_CONST).result
    expected = KURIN
    assert(actual === expected, "Результат додавання не підримує обробку іншим методом")
  end

  def test_chaining_sub
    actual = @icalc.substract(KURIN).substract(INIT_CONST).result
    expected = -KURIN
    assert(actual === expected, "Результат віднімання не підримує обробку іншим методом")
  end

  def test_chaining_add
    actual = @icalc.multiply(KURIN).substract(INIT_CONST).result
    expected = INIT_CONST * KURIN - INIT_CONST
    assert(actual === expected, "Результат множення не підримує обробку іншим методом")
  end

  def test_chaining_add
    actual = @icalc.divide(INIT_CONST).add(KURIN).result
    expected = KURIN + 1
    assert(actual === expected, "Результат ділення не підримує обробку іншим методом")
  end

  def test_memory_init
    actual = @icalc.memory
    expected = 0
    assert(actual === expected, "Початковий стан пам’яті не рівний 0")
  end

  def test_memory_clear
    @icalc.add_to_memory
    @icalc.clear

    assert_block ("Результат ділення не підримує обробку іншим методом") do
      if (@icalc.result == @icalc.memory && @icalc.memory != 0 )
        false
      else
        true
      end
    end
  end

  def test_memory_add
    temp = @icalc.memory
    actual = @icalc.add_to_memory.memory
    expected = temp + @icalc.result
    assert(actual === expected, "До пам’яті не додається актульние значення калькулятора")
  end

  def test_memory_substract
    temp = @icalc.memory
    actual = @icalc.substract_from_memory.memory
    expected = temp - @icalc.result
    assert(actual === expected, "Від пам’яті не віднімається актульние значення калькулятора")
  end

  def test_clear_method
    @icalc.add_to_memory
    @icalc.clear
    actual = @icalc.result
    expected = 0
    assert(actual === expected, "Пам’ять калькулятора не очищується")
  end
end