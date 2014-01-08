class SessionsController < ApplicationController

	def create
  		auth = request.env["omniauth.auth"]
  		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  		session[:user_id] = user.id
  		redirect_to new_location_path, :notice => "Signed in!"
	end

	def destroy
  		session[:user_id] = nil
  		redirect_to root_url, :notice => "Signed out!"
	end

	# def new
 #    	return redirect_to new_location_path if current_user
 #    	@authorize_url = foursquare.authorize_url(callback_session_url)
 #    end
  
  	def callback
    	code = params[:code]
    	@access_token = foursquare.access_token(code, callback_session_url)
    	session[:access_token] = @access_token
    
    	redirect_to new_location_path
  	end
end
