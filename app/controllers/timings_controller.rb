class TimingsController < ApplicationController
  before_action :require_admin, :admin_privacy, only: [:index, :new]
  
  def index
    @timings = Timing.all
  end

  def new
    @timing = Timing.new
  end

  def create
    @timing = Timing.new(timing_params)

    respond_to do |format|
      if @timing.save
        format.html { redirect_to timings_path, notice: 'Timing was successfully created.' }
        format.json { render :show, status: :created, timing: @timing }
      else
        format.html { render :new }
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
      params.require(:timing).permit(:day, :time)
    end
end
