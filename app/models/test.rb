class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :started_tests, dependent: :destroy
  has_many :users, through: :started_tests, dependent: :destroy
  
  def self.show_tests(category)
    Test.joins(:category).where(categories: {title: category}).order(title: :DESC).pluck(:title)
  end
end
