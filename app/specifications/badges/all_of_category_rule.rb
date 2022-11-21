module Badges
  class AllOfCategoryRule < AbstrcatRuleSpecification
    def satisfies?
      tests = Test.where(category_id: @option).pluck(:id)
      passed_tests = TestPassage.where(user_id: @test_passage.user, passed: true).pluck(:test_id).uniq

      tests.all? { |test| passed_tests.include?(test) }
    end
  end
end
