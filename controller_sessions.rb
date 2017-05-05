class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to user_path(@current_user)
        else
            render layout: nil
        end
    end

    def create
        if logged_in?
            redirect_to user_path(@current_user)
        else
            user = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
                log_in user
                redirect_to user_path(user)
            else
                flash[:login_error] = 'Invalid email/password combination'
                flash[:email] = params[:session][:email]
                redirect_to login_path
            end
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end
end
