class UsersController < ApplicationController
    
    def create
       user= User.new(user_params)
       if user.save
        session[:id] = user.id
        render json: {status: 201, user:user, logged_in: true}
       else
        render json: {status: 500, message: 'There was an error in creating new account'}
       end
    end

    def show
        user = User.find_by(id: params[:id])
        options = {
            include: [:outings, :activities]
          }
        render json: UserSerializer.new(user, options)
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
