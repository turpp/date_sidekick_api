class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:user][:username])

        if user&&user.authenticate(params[:user][:password])
            session[:id] = user.id
            render json: {status: 201, user: user, logged_in: true}
        else
            render json: {status: 401, message: 'User not found or password incorrect'}
        end
    end

    def logged_in
        if logged_in?
            render json: {status: 201, user: current_user, logged_in: true}
        else
            render json: {status: 400, user:{}, logged_in: false}
        end

    end

    def logout
        reset_session
        render json: {status: 200, user:{}, logged_in: false}
    end
end
