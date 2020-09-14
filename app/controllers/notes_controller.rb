class NotesController < ApplicationController
    before_action :set_note, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    before_action :owner_test, only:[:show, :edit, :update]

    def new
        if @ed_pursuit = EdPursuit.find_by_id(params[:ed_pursuit_id])
            @note = @ed_pursuit.notes.build
        else
            @note = Note.new
        end
    end
    
    def create
        # raise params.inspect
        @note = current_user.notes.build(note_params)
        @note.user_id = current_user.id
        if @note.save
            redirect_to note_path(@note)
        else
            render :new
        end
    end
    
    def show
        @note = Note.find_by_id(params[:id])
    end

    def index
        if params[:ed_pursuit_id]
            @ed_pursuit = EdPursuit.find_by_id(params[:ed_pursuit_id])
            @index_title = @ed_pursuit.name
            @notes = @ed_pursuit.notes.where(user_id: current_user)
        else
            @index_title = "All Educational Pursuits"
            @notes = Note.all.where(user_id: current_user)
        end
    end

    def update
        if @note.update(note_params)
          redirect_to note_path(@note)
        else
          render :edit
        end
    end

    private

    def note_params
        params.require(:note).permit(:ed_pursuit_id, :title, :content)
    end

    def set_note
        @note = Note.find_by_id(params[:id])
        redirect_to notes_path if !@note
    end

    def owner_test
        if current_user.id != @note.user_id
            # binding.pry
            # @user = current_user
            # @user.errors.add(:base, "You do not have permission to access that Note")
            redirect_to user_path(current_user)
        end
    end

end
