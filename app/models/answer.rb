class Answer < ApplicationRecord
  belongs_to :question
  
  validates :body, presence: true
  validate :validate_answers_quantity, on: :create
  
  scope :correct, -> { where(correct: true) }
  
  private

  def validate_answers_quantity
    errors.add(:question, 'не может иметь больше 4 ответов') if question.answers.count >= 4
  end
end
