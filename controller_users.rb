class UsersController < ApplicationController
    before_action :require_login
    before_action :correct_user,  only: [:show, :edit, :update]
    before_action :require_admin, only: [:index]

    def new
        @user = User.new
        @page_header = "Novo Usuário"
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show

    end

    def edit

    end

    def update
        redirect_to user_path(@current_user)
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
