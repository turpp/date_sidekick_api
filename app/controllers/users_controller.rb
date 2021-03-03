class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    # def create
    #     byebug
    #     @user=User.create(user_params)
    #     if @user.valid?
    #         @token = encode_token(user_id: @user.id)
    #         render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
    #     else
    #         render json: {error: 'failed to create user'}, status: :not_accaptable
    #     end
    # end

    # def profile
    #     render json: {user: UserSerializer.new(current_user)}, status: :accepted
    # end

    
    
    
    
    # private

    # def user_params
    #     params.require(:user).permit(:username, :password)
    # end
   
    
    # =============================

    def create
       user= User.new(user_params)
       if user.save
        # byebug
        session[:id] = user.id
        render json: {status: 201, user:user, logged_in: true}
       else
        render json: {status: 500, message: 'There was an error in creating new account'}
       end
    end

    def show
        user = User.find_by(id: params[:id])
        # byebug
        # render json: user, include: [:outings, include: [:activities], :activities]
        # render :json => user, :include => {:outings => {:include => :activities}} 
        # render :json => user, :include => {:outings => {:include => :activities}}
        options = {
            include: [:outings, :activities]
          }
        render json: UserSerializer.new(user, options)

        
        
        
        # render json: {user: user, outings: user.outings, activities: user.activities}

        
    end
    


    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
