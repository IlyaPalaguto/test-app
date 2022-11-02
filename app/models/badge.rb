class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  attribute :rule_option, :hash

  enum rule: %i[all_of first_try]
end
