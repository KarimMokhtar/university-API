class SessionsController < ApplicationController
    def create
        user = User.where(email: params[:email]).first
        
        if user && user.valid_password?(params[:password])
            user.save
            render json: user.as_json(only:[:email,:authentication_token]), status: :created
        else
            head(:unauthorized)
        end
        
    end

    def destroy
        # current_user && current_user.authentication_token = nil
        # p "sssssssss",params[:session]
        # p  current_user
        # if current_user.save
        #     head(:ok)
        # else
        #     head(:unauthorized)
        # end
        @user = User.where(authentication_token: params[:id]).first
        if @user
            @user.authentication_token = nil
            @user.save
        end
        render json: {"message" => "Done"}
    end
end