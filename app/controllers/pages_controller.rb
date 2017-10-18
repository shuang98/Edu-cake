class PagesController < ApplicationController
    def home
        if current_user
            redirect_to '/courses'
        end
    end
end
