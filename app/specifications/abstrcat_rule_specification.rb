class AbstrcatRuleSpecification
  def initialize(option:, test_passage:)
    @option = option
    @test_passage = test_passage
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end
