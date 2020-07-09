# Клас для збереження відповіді та її правильності.
# При створенні питання ми передаємо два обов'язкових параметри:
# текст відповіді та логічне значення, 
# яке вказує на правильність цієї відповіді.
# Також наявний метод-об'єктів для доброго виводу питання на екран.

class Answer
  attr_accessor :text, :correct

  def initialize text, correct
    @text = text
    @correct = correct
  end

  def generate number
    result = "    #{number}. #{text}"
    puts result
    result
  end

end