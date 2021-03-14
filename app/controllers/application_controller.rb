class ApplicationController < ActionController::Base
    
    include SessionsHelper
    
    private
    
    def require_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    def counts(user)
        @count_waterscapes = user.waterscapes.count
        @count_liker = user.liker.count
        @count_liked = user.liked.count
    end
    
end
