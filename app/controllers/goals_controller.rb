class GoalsController < ApplicationController
    before_action :redirect_if_not_logged_in

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
        @goal = Goal.find_by_id(params[:id])
    end

    def index
        # binding.pry
        @user = current_user
        @goals = @user.goals
    end

    def edit
        @goal = Goal.find(params[:id])
    end

    def update
        if @goal.update(goal_params)
          redirect_to user_path
        else
          render :edit
        end
    end

    private

    def goal_params
        params.require(:note).permit(:ed_pursuit_id, :title, :content)
    end
end