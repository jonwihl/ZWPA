class ApplicationController < ActionController::Base
	self.responder = ApplicationResponder
  	respond_to :html

  	protect_from_forgery with: :exception

  	private
  	# Handling authentication
	  	def current_user
	    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	  	end
	  	helper_method :current_user
	  
	  	def logged_in?
	     	current_user
	  	end
	  	helper_method :logged_in?
end
