class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }
  
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_quantity

  private

  def validate_answers_quantity
    errors.add(:question) if question.answers.size > 3
  end
end
