class BadgeDistributionService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  # def self.types
  #   {
  #     all_of_ruby: true
  #   }
  # end

  def call
    all_badges = Badge.where(rule_option: [{category_id: @test.category}, 
                                           {level: @test.level},
                                           nil])
    puts all_badges



    
    # all_badges = Badge.where("rule_option->'category' = ?", @test.category.id)
    #                   .or("rule_option->'level' = ?", @test.level)
    # all_tests = Test.all
    
    # all_badges.each {|badge|
    #   if Test.where(badge.rule_option).include(@test)

    # if @test.category == badge.rule_option
    #   tests = Test.where(badge.rule_option)
      
    #   # 'all_of' // 'first_try'
    #   rule = badge.rule
    #   # {"category_id"=>4}
    #   rule_option = badge.rule_option

    #   if badge.rule_option?
    #     send()
    #   }
      # if badge.rule send(badge.rule, badge.rule_option if badge.rule_option)
      
    # rules = Rule.where(category_id: @test.category)
    #             .or(Rule.where(level: @test.level)
    #             .or(Rule.where(category_id: nil, level: nil)))

    # rules.each do |rule|
    #   if rule.check(@user, @test)
    #     @user.badges << rule.badges.last
    #   end
    # end
  end

  def self.all_of(option)
    user = User.first
    tests = Test.where(option).pluck(:id)
    passed_tests = user.test_passages.passed_tests.pluck(:test_id).uniq

    tests.each {|test| return false unless passed_tests.include?(test)}

    true
  end

  def on_first_try?()
    TestPassage.where(test_id: test, user_id: user).size == 1
  end
end


# def method_missing(rule, user, test)
#   if /^all_of_category_id_\d+$/i.match?(rule)
#     category_id = rule.to_s.gsub(/^all_of_category_id_/i, '')
#     tests = Category.find(category_id).tests.pluck(:id)

#     passed_tests = user.test_passages.passed_tests.pluck(:test_id).uniq

#     tests.each {|test| return false unless passed_tests.include?(test)}

#     true
#   elsif /^all_of_level_\d+$/i.match?(rule)
#     level = rule.to_s.gsub(/^all_of_level_/i, '')
#     tests = Test.level(level).pluck(:id)

#     passed_tests = user.test_passages.passed_tests.pluck(:test_id).uniq

#     tests.each {|test| return false unless passed_tests.include?(test)}

#     true
#   else
#     raise NoMethodError
#   end
# end



