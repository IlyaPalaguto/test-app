class AddForgeinKeysToModels < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key(:tests, :categories)
    add_foreign_key(:questions, :tests)
    add_foreign_key(:answers, :questions)
  end
end
