class OutingsController < ApplicationController

    def create
        byebug
        user = User.find_by(id: params[:user][:id])
        date=params[:date]
        outing=Outing.new()
        outing.user=user
        activity=Activity.find_or_create_by(yelpID: params[:date][:id])
        if activity.name == nil
            activity.name = date[:name]
            activity.img_url = date[:image_url]
            activity.yelpUrl = date[:url]
            activity.categories = date[:categories]
            activity.price=date[:price]
            activity.adress = date[:location][:display_address]
            activity.phone = date[:display_phone]
        end
        outing.activities << activity
        outing.save
        render json: {status: 201}

    end
end
