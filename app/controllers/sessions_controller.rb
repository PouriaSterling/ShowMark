class SessionsController < ApplicationController
    # user shouldn't have to be logged in before logging in!
    skip_before_filter :set_current_user
    
    def create
        auth = request.env["omniauth.auth"]
        user = User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
        session[:user_id] = user.id
        redirect_to shows_path
    end
    
    def destroy
        session.delete(:user_id)
        flash[:notice] = 'Logged out successfully.'
        redirect_to shows_path
    end
    
    def failure
        flash[:warning] = "Sorry, couldn't authenticate with Facebook"
        redirect_to root_path
    end
end
