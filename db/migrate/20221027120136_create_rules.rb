class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :title
      t.references :category, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
