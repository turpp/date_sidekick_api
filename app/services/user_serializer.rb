class UserSerializer

    def initialize(user_object)
        @user = user_object
    end

    def to_serialized_json
        # byebug
        activities=@user.activities
        outings = @user.outings

        # render :json => user, :include => {:outings => {:include => :activities}} 


      end 
end