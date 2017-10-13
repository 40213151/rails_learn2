class ApplicationController < ActionController::Base
    before_action :set_current_yosakoiyer
    
    def set_current_yosakoiyer
        @current_yosakoiyer = Yosakoiyer.find_by(id: session[:yosakoiyer_id])
    end
    
    def authenticate_yosakoiyer
        if @current_yosakoiyer == nil
            flash[:notice] = "いやん"
            redirect_to("/login")
        end
    end
    
    def forbid_login_yosakoiyer
        if @current_yosakoiyer
            flash[:notice]="すでにログインしています"
            redirect_to("/posts/index")
        end
    end
end
