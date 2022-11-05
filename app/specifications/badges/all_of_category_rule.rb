module Badges
  class AllOfCategoryRule < AbstrcatRuleSpecification
    def satisfies?
      tests = Test.where(category_id: @option).pluck(:id)
      passed_tests = TestPassage.where(user_id: @test_passage.user, passed: true).pluck(:test_id).uniq

      tests.each {|test| return false unless passed_tests.include?(test)}

      true
    end
  end
end
