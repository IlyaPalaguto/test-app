class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    redirect_to test_path(params[:test_id])
  end

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
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
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
