class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  enum rule: { all_of_category: 'All of category',
               all_of_level: 'All of level',
               on_first_try: 'On first try' }
end
