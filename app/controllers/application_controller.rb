class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

	private

	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	# def current_user
 #      return nil if session[:access_token].blank?
 #      begin
 #        foursquare = Foursquare::Base.new(session[:access_token])
 #        @current_user ||= User.find(session[:user_id]) if session[:user_id]
 #      rescue Foursquare::InvalidAuth
 #        nil
 #      end
 #    end
    
    def foursquare
      unless current_user
        @foursquare ||= Foursquare::Base.new(Settings.app_id, Settings.app_secret)
      else
        @foursquare ||= Foursquare::Base.new(session[:access_token])
      end
    end
end
