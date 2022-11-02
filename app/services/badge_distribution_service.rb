class BadgeDistributionService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    rules = Rule.where(category_id: @test.category)
                .or(Rule.where(level: @test.level)
                .or(Rule.where(category_id: nil, level: nil)))

    rules.each do |rule|
      if rule.check(@user, @test)
        @user.badges << rule.badges.last
      end
    end
  end
end
