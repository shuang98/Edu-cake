class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to courses_path
		else
			render 'new'
		end
	end
	
	def index
		
	end

	def search
		if params[:search] && params[:search].length > 0
        	params[:search].downcase!
        	@results = User.where('LOWER(username) LIKE ?', "%#{params[:search]}%")
		else
			render 'index'
    	end
	end

	def show
  		@user = User.find(params[:id])
	end
	
  def edit
    	@user = User.find(params[:id])
  end

	def follow
			current_user.follow(User.find(params[:id]))
			redirect_to user_path(params[:id])
	end

	def unfollow
			current_user.stop_following(User.find(params[:id]))
			redirect_to user_path(params[:id])
	end
  
 def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
 end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end

		
	 # Confirms a logged-in user.
    def logged_in_user
      unless :logged_in_user?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless :current_user?
    end
  
		
end
