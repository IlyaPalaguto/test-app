class GistsController < ApplicationController

  def create
    @question = TestPassage.find(params[:id]).current_question
    
    result = GistQuestionService.new(@question).call

    if result.success?
      flash_options = { success: t('.success_html', gist_url: result.gist_url) }
      current_user.gists.create!(question: @question, url: result.gist_url)
    else
      flash_options = { danger: result.error_message }
    end

    redirect_to @test_passage, flash_options
    byebug
  end
  
end
