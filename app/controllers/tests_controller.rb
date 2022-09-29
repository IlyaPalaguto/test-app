class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
    # render inline: '<h1><%= "#{@test.title}, level: #{@test.level}" %></h1>'
  end
end
