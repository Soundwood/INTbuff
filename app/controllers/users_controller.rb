class UsersController < ApplicationController
    before_action :owner_test, only:[:show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @most_goals_user = User.ordered_by_goals[0].email
        if params[:id]
            @user = User.find_by_id(params[:id])
          else
            @user = current_user
        end
        redirect_to '/welcome' if !@user # redirect if user does not exist
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user)
        else
          render :edit
        end
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :goal_ids, :goal)
    end

    def owner_test
        if session[:user_id] == nil
            redirect_to '/welcome'
        elsif session[:user_id].to_s != params[:id]
            redirect_to user_path(current_user)
        end
    end
end
