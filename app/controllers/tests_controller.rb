class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def show
    render inline: '<h1><%= "#{@test.title}, level: #{@test.level}" %></h1>'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
