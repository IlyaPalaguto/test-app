class Question < ApplicationRecord
  belongs_to :test
  
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true
  
  before_validation :before_validation_set_position, on: :create

  private

  def before_validation_set_position
    self.position = self.test.questions.count + 1
  end

end
