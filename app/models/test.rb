class Test < ApplicationRecord
  def self.show_tests(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order('title DESC')
  end
end
