class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :get_current_month
	  def get_current_month
	  	today = Date.today
	  	@current_years = "#{today.year}-#{today.month}"
	  end

  	private
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :email])
  	end
end