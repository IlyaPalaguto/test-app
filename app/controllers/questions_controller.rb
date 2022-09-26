class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
  end
  
  def show
  end

  def new
  end

  def create
    Question.create(question_params)
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def rescue_with_test_not_found
    render html: '<h1>Вопрос не найден</h1>'.html_safe
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_questions
    @questions = Question.where(test_id: params[:test_id])
  end
  
  def find_question
    @question = Question.find(params[:id])
  end
end
