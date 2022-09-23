class Answer < ApplicationRecord
  belongs_to :question
  
  validates :body, presence: true
  validate :validate_answers_quantity, on: :create
  
  scope :correct, -> { where(correct: true) }
  
  private

  def validate_answers_quantity
    errors.add(:question) if question.answers.size >= 4
  end
end
