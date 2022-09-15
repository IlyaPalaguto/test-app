class ChangeColumnForForgeinKeysAccpets < ActiveRecord::Migration[6.1]
  def change
    remove_column(:tests, :categories_id, :integer)
    add_column(:tests, :category_id, :integer)
  end
end
