class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
      		session[:user_id] = user.id
      		redirect_to courses_path
    	else
    		flash[:error] = "Email or password is incorrect"
    		redirect_to login_path
    	end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to home_path
	end
end
