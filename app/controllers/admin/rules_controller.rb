class Admin::RulesController < Admin::BaseController
  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)
    
    if @rule.save
      redirect_to new_admin_badge_path, success: 'Rule created'
    else
      render :new, danger: 'Something wrong'
    end
  end

  private

  def rule_params
    params.require(:rule).permit(:description, :level, :category_id)
  end
end
