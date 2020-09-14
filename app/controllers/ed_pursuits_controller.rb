class EdPursuitsController < ApplicationController
    before_action :set_ed_pursuit, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    before_action :owner_test, only:[:show, :edit, :update]

    def new
        @ed_pursuit = EdPursuit.new
    end

    def create
        @ed_pursuit = EdPursuit.create(ed_pursuit_params)
        @ed_pursuit.user_id = session[:user_id]
        if @ed_pursuit.save
            redirect_to ed_pursuit_path(@ed_pursuit)
        else
            render :new
        end
    end

    def index
        @ed_pursuits = EdPursuit.all.where(user_id: current_user)
    end

    def show
        @ed_pursuit = EdPursuit.find_by_id(params[:id])
    end

    def update
        if @ed_pursuit.update(ed_pursuit_params)
          redirect_to ed_pursuit_path(@ed_pursuit)
        else
          render :edit
        end
    end

    private

    def ed_pursuit_params
        params.require(:ed_pursuit).permit(:ed_type_id, :name, :subject, :provider_id, 
            :instructor, :start_date, :duration_d, :link, :short_description)
    end

    def set_ed_pursuit
        @ed_pursuit = EdPursuit.find_by_id(params[:id])
        redirect_to ed_pursuits_path if !@ed_pursuit
    end

    def owner_test
        if current_user.id != @ed_pursuit.user_id
            redirect_to user_path(current_user)
            @user = current_user
            @user.errors.add(:base, "You do not have permission to access that Educational Pursuit")
        end
    end
end
