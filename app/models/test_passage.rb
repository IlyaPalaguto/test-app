class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_validation :before_validation_calculate_result, on: :update, if: :completed?

  def completed?
    self.current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end
  
  private
  
  def before_validation_set_first_question
    self.current_question = test.questions.order(:position).first
  end
  
  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_calculate_result
    self.result = self.correct_questions * 100.0 / self.test.questions.count
  end
  
  def correct_answer?(answer_ids)
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort
  end
  
  def correct_answer
    self.current_question.answers.correct
  end
  
  def next_question
    self.test.questions.order(:position).where('position > ?', current_question.position).first
  end

end
