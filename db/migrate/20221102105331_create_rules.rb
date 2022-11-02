class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :description, null: false
      t.string :title, null: false
      t.integer :level
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
