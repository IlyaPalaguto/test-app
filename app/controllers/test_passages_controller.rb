class TestPassagesController < ApplicationController

  before_action :find_test_passage, only: %i[show update result end]

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      @test_passage.calculate_result
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  
  def end
    @test_passage.calculate_result
    redirect_to result_test_passage_path(@test_passage)
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
