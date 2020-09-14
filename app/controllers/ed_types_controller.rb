class EdTypesController < ApplicationController
    
    
    private

    def set_ed_type
        @ed_type = EdType.find_by_id(params[:id])
        redirect_to ed_types_path if !@ed_type
    end
end
