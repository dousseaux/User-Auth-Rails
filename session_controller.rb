class SessionController < ApplicationController
    def new
        if authenticated
            redirect_to user_path
        else
            render 'users/sign-in'
        end
    end

    def create
        if authenticated
            redirect_to user_path
        else
            user = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
                signin user
                redirect_to user_path
            else
                flash[:alert] = 'Invalid email or password'
                flash[:email] = params[:session][:email]
                redirect_to signin_path
            end
        end
    end

    def destroy
        signout
        redirect_to root_path
    end
end
