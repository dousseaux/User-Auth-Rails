module SessionHelper
    # Sign in given user.
    def signin(user)
        session[:user_id] = user.id
    end

    # Sign out current user.
    def signout
        session.delete(:user_id)
        @user = nil
    end

    # Returns current authenticated user (if any).
    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

    # Returns true if the user is logged in, false otherwise.
    def authenticated
        !current_user.nil?
    end

    # Require authentication to continue
    def require_auth
        unless authenticated
            flash[:alert] = 'Authentication required.'
            redirect_to signin_path
        end
    end

    # Require being logged in to access pages
    def require_admin
        require_auth
        unless @user.admin?
            render json: { message: 'Authorization failed.'}, status: 403
        end
    end
end
