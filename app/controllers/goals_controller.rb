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
        # if params[:ed_pursuit_id]
        #     @ed_pursuit = EdPursuit.find_by_id(params[:ed_pursuit_id])
        #     @index_title = @ed_pursuit.name
        #     @goals = @ed_pursuit.goals.where(user_id: current_user)
        # else
        #     @index_title = "All Educational Pursuits"
        #     @goals = Note.all.where(user_id: current_user)
        # end
    end

    def update
        if @goal.update(goal_params)
          redirect_to goal_path(@goal)
        else
          render :edit
        end
    end

    private

    def goal_params
        params.require(:note).permit(:ed_pursuit_id, :title, :content)
    end
end