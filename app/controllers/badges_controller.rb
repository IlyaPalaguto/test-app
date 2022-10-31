class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def own
    @badges = current_user.badges
  end
end
