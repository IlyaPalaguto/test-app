class CreateStartedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :started_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.boolean :finished, default: false, null: false

      t.timestamps
    end
  end
end
