class CreateStartedTestsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table(:tests, :users, table_name: 'started_tests') do |t|
      t.index [:test_id, :user_id], unique: true
      # t.index [:user_id, :test_id]
      t.boolean :finished, default: false, null: false
    end
  end
end
