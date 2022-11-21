module Badges
  class OnFirstTryRule < AbstrcatRuleSpecification
    def satisfies?
      TestPassage.where(test_id: @test_passage.test, user_id: @test_passage.user).size == 1
    end
  end
end
