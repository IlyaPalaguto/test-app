class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :started_tests, dependent: :destroy
  has_many :users, through: :started_tests, dependent: :destroy
  
  def self.show_tests(category)
    Category.find_by(title: category).tests.order(title: :DESC)
  end
end
