class Test < ApplicationRecord
  scope :level, -> (level) { where(level: level) }
  scope :easy_levels, -> { level(0..1) }
  scope :middle_levels, -> { level(2..4) }
  scope :hard_levels, -> { level(5..Float::INFINITY) }
  
  belongs_to :author, class_name: 'User'
  belongs_to :category
  
  has_many :questions, dependent: :destroy
  has_many :started_tests, dependent: :destroy
  has_many :users, through: :started_tests, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }
  validate :validate_level_not_negative
  
  def self.show_tests(category)
    Test.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end

  private

  def validate_level_not_negative
    errors.add(:level) if level < 0
  end
end
