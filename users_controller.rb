class UsersController < ApplicationController
    before_action :require_auth
    before_action :require_admin, only: [:index, :new, :create, :destroy]

    def index
    end

    def show
        redirect_to user_profile_path
    end

    def new
        @new_user = User.new
    end

    def create
        @new_user = User.new(user_params_admin)
        if @new_user.save
            redirect_to users_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        success = true
        updates = user_params
        @user.name = updates[:name]
        @user.email = updates[:email]
        unless updates[:password].blank?
            success = false
            if @user.authenticate(updates[:password_current])
                if updates[:password] == updates[:password_confirmation]
                    @user.password = updates[:password]
                    success = true
                end
            end
        end
        if success
            if @user.save
                flash[:notice] = 'Changes saved successfully.'
            else
                flash[:alert] = 'Failed to save changes.'
            end
        else
            flash[:notice] = 'Failed to update password.'
        end
        render 'edit'
    end

    def destroy
        user = User.find(params[:user_id])
        unless user.blank?
            user.destroy
        end
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_current)
    end

    def user_params_admin
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_current, :admin)
    end
end
