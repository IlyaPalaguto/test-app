module GistsHelper
  def sliced_question_body(question)
    question.size > 25 ? "#{question.slice(0...25)}...?" : question
  end
end
