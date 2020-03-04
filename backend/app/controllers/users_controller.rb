class UsersController < ApplicationController
    
    def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, token: generate_token({ id: user.id },), id: user.id, user: user}
        else
            render json: {message: "No valid"}
        end
    end

    def sign_up
        user = User.create(username: params[:username], password: params[:password], email: params[:email], name: params[:name], lastname: params[:lastname], img_url: params[:img_url])
        if user.valid?
            render json: {message: "SUCCESS!"}
        else
            render json: {message: "No valid"}
        end
    end

    def validate
        user = get_user
        if user
            render json: {username: user.username, token: generate_token({id: user.id})}
        else
            render json: {message: "You are not authorized"}
        end
    end

    def my_profile
        user = User.find(params[:id])
        if user 
            render json: {user: user}
        end
    end

    def update_profile
        user = User.find(params[:id])
        if user
            user.update(users_params)
            render json: {user: user}
        end
    end

    private

    def users_params
        params.require(:user).permit(:username, :name, :lastname, :email, :password, :img_url )
    end
end
