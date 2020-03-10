class Api::V1::UsersController < ApplicationController

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: :created
        else
            render jsont: @user.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
