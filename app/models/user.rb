class User < ApplicationRecord
  def show_started_tests(level)
    Test.joins('JOIN started_tests ON tests.id = started_tests.test_id')
      .where(started_tests: { user_id: self.id }, tests: { level: level })
  end
end
