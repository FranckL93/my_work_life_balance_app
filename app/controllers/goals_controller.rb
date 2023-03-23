class GoalsController < ApplicationController

  before_action :authenticate_user!

  def index
    @goals = current_user.goals
  end

  def new
    @goal = current_user.goals.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to @goal, notice: 'Goal created successfully.'
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :deadline, :status)
  end

end
