class AddTimerToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :integer
    add_column :test_passages, :time_left, :integer
    add_index :tests, :timer
  end
end
