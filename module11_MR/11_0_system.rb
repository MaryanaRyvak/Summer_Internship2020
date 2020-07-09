require_relative "11_3_quiz"

# Основний модуль програми
# 
# тут формується об'єкт тексту Quiz,
# наповнюється його питаннями Question
# викликається метод для проходження тесту та
# виводяться результати тестування.
# 
# Для його роботи необхідно підключити файл з класом Quiz.

active_quiz = Quiz.new

# Наповнення тесту питаннями
(1..5).each { |f|
  question = Question.new "За якою позицією ховається відповідь?",
                          "Номер відповіді випадає випадковим чином."
  (1..5).each { |e|
    state = ( (rand(46) % 2 == 0) ? true : false)
    question.add_answer Answer.new("Відповідь тут", state)
  }
  #question.add_answer Answer.new("Відповідь тут", true)

  active_quiz.add_question question
}

# Запускається процес тестування
active_quiz.start
# Формується і виводиться аналітика по результатах тестування
active_quiz.generate_result