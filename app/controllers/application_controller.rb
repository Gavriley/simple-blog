class ApplicationController < ActionController::Base
	
	include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: -> { redirect_to root_path, notice: "Такої сторінки не існує." } 

  rescue_from CanCan::AccessDenied, with: -> { redirect_to root_url, :notice => "Недостатньо прав для здійснення даної дії" }

	# def javascript_exists?(script)
	#   script_path = "#{Rails.root}/app/assets/javascripts/#{script}.js"
	#   File.exists?(script_path) || File.exists?("#{script_path}.coffee") 
	# end

	# def stylesheet_exists?(stylesheet)
 #   	stylesheet = "#{Rails.root}/app/assets/stylesheets/#{params[:controller]}.css"
 #   	File.exists?(stylesheet) || File.exists?("#{stylesheet}.scss") 
 # 	end
end
