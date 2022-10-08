class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :strig, null: false, default: 'User'
    add_column :users, :last_name, :string
    add_index :users, :type
  end
end
