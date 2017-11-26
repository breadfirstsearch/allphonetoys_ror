class TimingsController < ApplicationController
  before_action :require_admin, :admin_privacy, only: [:index, :new, :edit]

  def index
    @timings = Timing.all
  end

  def user_timings
    @timings = Timing.all
    @timings.each do |timing|
      timing.date = date_of_next(timing.day)
    end
    @timings = @timings.sort_by &:date
  end

  def new
    @timing = Timing.new
  end

  def edit
    @timing = Timing.find(params[:id])
  end

  def create
    @timing = Timing.new(timing_params)

    respond_to do |format|
      if @timing.save
        format.html { redirect_to timings_path, notice: 'Timing was successfully created.' }
        format.json { render :show, status: :created, location: @timing }
      else
        format.html { render :new }
        format.json { render json: @timing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @timing = Timing.find(params[:id])

    respond_to do |format|
      if @timing.update(timing_params)
        format.html { redirect_to timings_path, notice: 'Timing was successfully updated.' }
        format.json { render :show, status: :ok, location: @timing }
      else
        format.html { render :edit }
        format.json { render json: @timing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Timing.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to timings_path, notice: 'Timing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def timing_params
      params.require(:timing).permit(:day, :hours, :minutes, :ampm)
    end

    def format_time(time)
      startTime = time.length <= 2 ? time + ":00" : time
      endTime = time.to_i + 2
      endTime = endTime > 24 ? 00 : endTime
      endTime = time.length <= 2 ? endTime.to_s + ":00" : endTime.to_s
      time = startTime + " - " + endTime
    end

end
