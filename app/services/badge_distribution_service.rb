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
    rules = Rule.where(category_id: @test.category)
                .or(Rule.where(level: @test.level)
                .or(Rule.where(category_id: nil, level: nil)))

    rules.each do |rule|
      if rule.check(@user, @test)
        @user.badges << rule.badges.last
      end
    end
  end

  def self.all_of(option)
    user = User.first
    tests = Test.where(option).pluck(:id)
    passed_tests = user.test_passages.passed_tests.pluck(:test_id).uniq

    tests.each {|test| return false unless passed_tests.include?(test)}

    true
  end

  def on_first_try?(user, test)
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



