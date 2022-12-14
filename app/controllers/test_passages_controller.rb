class TestPassagesController < ApplicationController

  before_action :find_test_passage, only: %i[show update result]

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      @test_passage.calculate_result
      BadgeDistributionService.new(@test_passage).call if @test_passage.passed
      redirect_to result_test_passage_path(@test_passage)
      end
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
