class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', foreign_key: "author_id", dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  has_secure_password

  def show_test_passage(level = 0..10)
    self.tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
