class BadgeDistributionService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  BadgeDistribution = Struct.new(:badges) do
    def awarded?
      badges.any?
    end
  end

  def call
    issue_badges = []

    all_badges = Badge.where(rule_option: {'level'=>@test.level})
                      .or(Badge.where(rule_option: [{'category_id'=>@test.category_id}, nil]))
    
    all_badges.each {|badge|
      if send(badge.rule, badge.rule_option)
        @user.badges << badge
        issue_badges << badge
      end
    }

    BadgeDistribution.new(issue_badges)
  end
  
  private

  def all_of(option)
    tests = Test.where(option).pluck(:id)
    passed_tests = @user.test_passages.passed_tests.pluck(:test_id).uniq

    tests.each {|test| return false unless passed_tests.include?(test)}

    true
  end

  def first_try(option = nil)
    TestPassage.where(test_id: @test, user_id: @user).size == 1
  end
end
