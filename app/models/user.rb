class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: "author_id", dependent: :destroy
  has_many :started_tests, dependent: :destroy
  has_many :tests, through: :started_tests, dependent: :destroy

  def show_started_tests(level)
    self.tests.where(level: level)
  end
end
