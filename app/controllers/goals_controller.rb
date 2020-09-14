class GoalsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_goal, only:[:show, :edit, :update]
    before_action :owner_test, only:[:show, :edit, :update]

    def new
        @goal = Goal.new
    end
    
    def create
        @goal = current_user.goals.build(goal_params)
        @goal.user_id = current_user.id
        if @goal.save
            redirect_to goal_path(@goal)
        else
            render :new
        end
    end
    
    def show
    end

    def index
        # binding.pry
        @user = current_user
        @goals = @user.goals
    end

    def edit
    end

    def update
        if @goal.update(goal_params)
          redirect_to user_path
        else
          render :edit
        end
    end

    private

    def set_goal
        @goal = Goal.find_by_id(params[:id])
        redirect_to goals_path if !@goal
    end

    def goal_params
        params.require(:goal).permit(:name)
    end

    def owner_test
        if current_user.id != @goal.user_id
            redirect_to user_path(current_user)
            @user = current_user
            @user.errors.add(:base, "You do not have permission to access that Educational Pursuit")
        end
    end
end