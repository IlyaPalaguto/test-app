class GistsController < ApplicationController
  
  def create
    @test_passage = TestPassage.find(params[:id])
    begin
      result = GistQuestionService.new(@test_passage.current_question).call
      flash_options = { success: t(".success_html", gist_url: result[:html_url]) }

      gist = current_user.gists.build(question: @test_passage.current_question, url: result[:html_url])

      gist.save!

    rescue Octokit::Error => e
      flash_options = { danger: e.message }
    end

    redirect_to @test_passage, flash_options
  end
end
