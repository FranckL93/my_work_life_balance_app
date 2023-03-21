class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = current_user.reminders.build(reminder_params)
    if @reminder.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(:name, :date, :time)
  end
end
