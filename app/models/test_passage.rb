class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question
  before_validation :before_validation_set_time_left, unless: Proc.new { test.timer.nil? }

  SUCCESS_RATIO = 85.freeze

  def completed?
    current_question.nil? || timesUp?
  end

  def passed?
    result >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end
  
  def calculate_result
    update_columns(result: correct_questions * 100.0 / test.questions.count)
  end

  def progress
    if current_question
      ((test.questions.index(current_question).to_f) / test.questions.length * 100).round
    else
      100
    end
  end

  private

  def before_validation_set_time_left
    if created_at
      self.time_left = (created_at + test.timer.seconds) - Time.current
    else
      self.time_left = test.timer
    end
  end
  
  def before_validation_set_current_question
    self.current_question = next_question
  end
  
  def next_question
    if current_question.present?
      test.questions.order(:position).where('position > ?', current_question.position).first
    else
      current_question = test.questions.find_by(position: 1)
    end
  end
  
  def correct_answer?(answer_ids)
    false
    
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
  end
  
  def correct_answer
    current_question.answers.correct
  end

  def timesUp?
    time_left <= 0 if test.timer
  end
  
end
