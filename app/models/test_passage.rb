class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  scope :passed_tests, -> { where("result >= ?", SUCCESS_RATIO) }

  before_validation :before_validation_set_current_question

  def completed?
    self.current_question.nil?
  end

  def passed?
    self.result >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end
  
  def calculate_result
    self.update_columns(result: self.correct_questions * 100.0 / self.test.questions.count)
  end

  def progress
    if current_question
      ((test.questions.index(current_question).to_f) / test.questions.length * 100).round
    else
      100
    end
  end

  private
  
  def before_validation_set_current_question
    self.current_question = next_question
  end
  
  def next_question
    if self.current_question.present?
      self.test.questions.order(:position).where('position > ?', current_question.position).first
    else
      self.current_question = self.test.questions.find_by(position: 1)
    end
  end
  
  def correct_answer?(answer_ids)
    false
    
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end
  
  def correct_answer
    self.current_question.answers.correct
  end
  
end
