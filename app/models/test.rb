class Test < ApplicationRecord
  def self.show_tests(category)
    Test.where(category_id: Category.find_by(title: category).id).order('title ASC')
  end
end
