class TestsController < ApplicationController

  before_action :find_test, only: %i[destroy show edit update start]
  before_action :find_user, only: %i[new create start]

  def index
    @tests = Test.all
  end
  
  def new
    @test = @user.created_tests.build
  end

  def create
    @test = @user.created_tests.build(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end
  
  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_user
    @user = current_user
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
