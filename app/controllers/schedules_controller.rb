class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules
    @schedule = Schedule.new
  end
  
  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = current_user.schedules.find(params[:id])
  end

  def create
    @schedule = current_user.schedules.build(schedule_parameter)
  
    if @schedule.save
      redirect_to schedules_path, success: t('schedules.create.success')
    else 
      redirect_to schedules_path,danger: t('schedules.create.fail')
    end
  end

  def destroy
    @schedule = current_user.schedules.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, success: t('defaults.message.deleted')
  end

  def edit
    @schedule = current_user.schedules.find(params[:id])
  end

  def update
    @schedule = current_user.schedules.find(params[:id])

    if @schedule.update(schedule_parameter)
      redirect_to @schedule, success: t('defaults.message.updated')
    else
      flash.now[:danger] = t('defaults.message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:title, :content, :start_time, :reminder_time)
  end
end