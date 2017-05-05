module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    # Logs out the current user.
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    # Require being logged in to access pages
    def require_login
      unless logged_in?
        flash[:login_error] = "Por favor, faça o login"
        redirect_to login_url
      end
    end

    # Require being logged in to access pages
    def require_admin
        require_login
        unless @current_user.admin?
            redirect_to(root_url)
        end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user  || @current_user.admin?
    end
end
