class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        if params[:id]
            @user = User.find_by_id(params[:id])
          else
            @user = current_user
        end
        redirect_to '/welcome' if !@user # redirect if user does not exist
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
