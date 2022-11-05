module Badges
  class AllOfLevelRule < AbstrcatRuleSpecification
    def satisfies?
      tests = Test.where(level: @option).pluck(:id)
      passed_tests = TestPassage.where(user_id: @test_passage.user, passed: true).pluck(:test_id).uniq

      tests.each {|test| return false unless passed_tests.include?(test)}

      true
    end
  end
end
