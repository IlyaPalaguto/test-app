class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy show]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, success: "Badge created"
    else
      render :new
    end
  end

  def index
    @badges = Badge.all
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :rule, :rule_option)
  end

end
