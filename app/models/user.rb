class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: "author_id"
  has_many :started_tests
  has_many :tests, through: :started_tests
  def show_started_tests(level)
    Test.joins('JOIN started_tests ON tests.id = started_tests.test_id')
      .where(started_tests: { user_id: self.id }, tests: { level: level })
  end
end
