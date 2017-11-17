class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :current_admin
  before_action :set_variables

  def require_user
    redirect_to '/login' unless current_user
  end

  def require_admin
    redirect_to '/login' unless current_admin
  end

  def set_variables
    @loggedin_user = User.new
    if current_user
      @loggedin_user = current_user
    end
    @providers = Provider.find_by_sql("SELECT * FROM providers")
    @locations = Location.find_by_sql("SELECT * FROM locations")
    @hours = [['1','01'],['2','02'],['3','03'],['4','04'],['5','05'],['6','06'],['7','07'],['8','08'],['9','09'],['10','10'],['11','11'],['12','12']]
    @minutes = [['00','00'],['15','15'],['30','30'],['45','45']]
  end
end
