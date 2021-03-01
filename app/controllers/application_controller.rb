class ApplicationController < ActionController::Base
    # before_action :authorized

    # def encode_token(payload)
    #     JWT.encode(payload, "dKJt2yv3H5k7pQcN")
    # end

    # def decode_token(token)
    #     if auth_header
    #         token=auth_header.split(' ')[1]
    #         begin
    #             JWT.decode(token, "dKJt2yv3H5k7pQcN")[0]

    #         rescue JWT::DecodeError
    #             nil
    #         end
    #     end
    # end

    # def auth_header
    #     request.headers['Authorization']
    # end

    # def current_user
    #     if decode_token
    #         user_id=decode_token[0]['user_id']
    #         @user = User.find_by(id: user_id)
    #     end
    # end

    # def logged_in?
    #     !!current_user
    # end

    # def authorized
    #     render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    # end

    skip_before_action :verify_authenticity_token
    helper_method :logged_in, :current_user
    
    def logged_in
        !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:id]) if session[:id]
    end
end
