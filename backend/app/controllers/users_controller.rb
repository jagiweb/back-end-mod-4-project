class UsersController < ApplicationController
    
    def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, token: generate_token({ id: user.id })}
        else
            render json: {message: "No valid"}
        end
    end

    # def create
    #     # user = User.new
    #     user = User.new
    #     if user
    #         render json: {message: "SUCCESS!"}
    #     else
    #         render json: {message: "No valid"}
    #     end
    # end

    def sign_up
        user = User.new
        if user
            user.save(username: params[:username], password: params[:passowrd], email: params[:email], name: params[:name], lastname: params[:lastname])
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
