class SchedulesController < ApplicationController
  # before_action :schedule_params, only: [:show, :edit, :update, :destroy]
  before_action :schedule_params, only: [:update]

  def index
    @schedules = Schedule.all.order(start_time: :asc)
    @total_schedules = Schedule.count
    @current_date = Time.now.in_time_zone('Asia/Tokyo').to_date
    @schedule = Schedule.new
  end

  def show
    @schedules = @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: 'スケジュールを作成しました'
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
       redirect_to schedules_path, notice: 'スケジュールを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice: 'スケジュールを削除しました'
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :end_time, :all_day, :memo)
  end
end

