require_relative "11_2_question"

# 
# Клас для створення тесту. Володіє множиною питань.
# Є можливість задавати питання типу Question при ініціалізації об'єкту.
# Також є метод для додавання питання до питань тесту.
# 
# Об'єкти цього класу можуть:
#   почергово виводити питання та записувати відповді на них
#   підраховувати у відсотках кількість правильних відповідей
#   генерувати підсумкову табличку на основі результатів тесту
# 
# Клас залежить від класу Question.
# 

class Quiz
  attr_accessor :questions

  # метод може приймати довільну кількість параметрів
  def initialize *questions
    begin
      raise ArgumentError, "questions is nil." if questions.nil?
      @questions = questions
    rescue ArgumentError
      questions = []
      retry
    end
  end

  # метод приймає 1 питання і додає його до множини питань
  def add_question question
    @questions << question
  end

  # метод запускає для проходження послідовність питань
  def start
    puts "Відповіді на питання слід давати у вигляді цілих чисел."
    puts "Якщо на питання є декілька відповідей, ваші варіанти слід розділяти комами."
    @questions.each_with_index { |question, index|
      question.generate index
       }
  end

  # метод підраховує правильність відповід по кожному питанню
  def count_result
    result = 0
    @questions.each { |question|
      result += question.check
    }
    result / @questions.count
  end

  # метод генерує у консоль загальну аналітику пройденого тесту
  def generate_result
    puts ""
    #puts "Ви вказали #{ (count_result * 100).ceil }% усіх правильних відповідей."

    @questions.each_with_index { |question, index|
      question.generate_result index
    }

    puts "Ви вказали #{ (count_result * 100).ceil }% усіх правильних відповідей."
  end
end
