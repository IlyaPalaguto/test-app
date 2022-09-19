class User < ApplicationRecord
  def show_started_tests(level)
    started_tests = StartedTest.where(user_id: self.id)
    started_tests.map do |started_test|
      current_test = Test.find_by(id: started_test.test_id)
      current_test if current_test.level == level
    end
  end
end
