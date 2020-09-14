class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        user = user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        session[:user_id] = user.id
        @user = user
        redirect_to user_path(@user)
    end
    
    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    def omniauth
        if params[:provider] == 'google_oauth2'
            @user = User.from_google_omniauth(auth)
        elsif params[:provider] == 'facebook'
            @user = User.from_facebook_omniauth(auth)
        elsif params[:provider] == 'github'
            @user = User.from_github_omniauth(auth)
        end 
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    private
    
    def auth
        request.env['omniauth.auth']
    end
end