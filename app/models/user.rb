class User < ApplicationRecord
  def show_started_tests(level)
    tests_id = StartedTest.joins(
      'JOIN users ON started_tests.user_id = users.id'
    ).joins(
      'JOIN tests ON started_tests.test_id = tests.id'
    ).where(
      'users.id = ? AND tests.level = ?', self.id, level
    ).pluck('tests.id')

    Test.where(id: tests_id)
  end
end
