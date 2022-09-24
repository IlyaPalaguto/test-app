class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  
  has_many :questions, dependent: :destroy
  has_many :started_tests, dependent: :destroy
  has_many :users, through: :started_tests, dependent: :destroy
  
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  scope :level, -> (level) { where(level: level) }
  scope :easy_levels, -> { level(0..1) }
  scope :middle_levels, -> { level(2..4) }
  scope :hard_levels, -> { level(5..Float::INFINITY) }
  scope :with_category, -> (category) { joins(:category).where(categories: {title: category}) }
  
  def self.show_tests(category)
    Test.with_category(category).order(title: :desc).pluck(:title)
  end
end
