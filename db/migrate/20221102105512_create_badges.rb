class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :rule, null: false
      t.jsonb :rule_option, null: false

      t.timestamps
    end
  end
end
