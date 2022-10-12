class TestPassagesController < ApplicationController

  before_action :find_test_passage, only: %i[show update result gist]

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

  def gist
    begin
      result = GistQuestionService.new(@test_passage.current_question).call
      flash_options = { success: t(".success_html", gist_url: result[:html_url]) }
    rescue Octokit::Error => e
      flash_options = { danger: e.message }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
