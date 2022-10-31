class Rule < ApplicationRecord
  has_many :badges, dependent: :destroy
  belongs_to :category, optional: true

  before_validation :before_validation_set_correct_title, on: :create

  def check(user, test)
    send(self.title, user, test)
  end

  private

  def before_validation_set_correct_title
    if /all of/i.match?(self.title)
      self.title = "all_of_category_id_#{self.category_id}" if self.category_id
      self.title = "all_of_level_#{self.level}" if self.level
    elsif /first try/i.match?(self.title)
      self.title = 'on_first_try?'
    end
  end

  def method_missing(rule, user, test)
    if /^all_of_category_id_\d+$/i.match?(rule)
      category_id = rule.to_s.gsub(/^all_of_category_id_/i, '')
      tests = Category.find(category_id).tests.pluck(:id)

      passed_tests = user.test_passages.passed_tests.pluck(:test_id).uniq

      tests.each {|test| return false unless passed_tests.include?(test)}

      true
    else
      raise NoMethodError
    end
  end

  def on_first_try?(user, test)
    TestPassage.where(test_id: test, user_id: user).size == 1
  end
end
