class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :started_tests
  has_many :users, through: :started_tests
  def self.show_tests(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: {title: category})
      .order(title: :DESC)
      .pluck(:title)
  end
end
