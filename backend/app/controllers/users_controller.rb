class UsersController < ApplicationController
    
    def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, token: generate_token({ id: user.id })}
        else
            render json: {message: "No valid"}
        end
    end

    def sign_up
        user = User.create(username: params[:username], password: params[:password], email: params[:email], name: params[:name], lastname: params[:lastname])
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
    private

    def users_params
        
    end
end
