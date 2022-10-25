class FeedbackController < ApplicationController
  def create
    FeedbackMailer.send_feedback(current_user, params[:letter]).deliver_now

    redirect_to root_path
  end
end
