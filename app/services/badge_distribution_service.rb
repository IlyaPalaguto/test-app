class BadgeDistributionService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  RULES = {
    all_of_category: AllOfCategoryRule,
    all_of_level: AllOfLevelRule,
    on_first_try: OnFirstTryRule
  }.freeze

  def call
    Badge.find_each {|badge|
      add_badge(badge) if RULES[badge.rule.to_sym].new(option: badge.rule_option, test_passage: @test_passage).satisfies?
    }
  end
  
  private

  def add_badge(badge)
    @test_passage.user.badges << badge
  end
end
