class OutingsController < ApplicationController

    def create
        # byebug
        user = User.find_by(id: params[:user][:id])

        if params[:type]=='food'
        food=params[:food]
        outing=Outing.new()
        outing.user=user
        activity=Activity.find_or_create_by(yelpID: params[:food][:id])
        if activity.name == nil
            activity.name = food[:name]
            activity.img_url = food[:image_url]
            activity.yelpUrl = food[:url]
            activity.categories = food[:categories]
            activity.price=food[:price]
            activity.adress = food[:location][:display_address]
            activity.phone = food[:display_phone]
        end
        outing.activities << activity
        outing.save
        activity.save
        render json: {status: 201}
        end

        if params[:type]=='foodActivity'
            food=params[:food]
            activity=params[:activity]
            outing=Outing.new()
            outing.user=user
            
            dateFood=Activity.find_or_create_by(yelpID: params[:food][:id])
            if dateFood.name == nil
                dateFood.name = food[:name]
                dateFood.img_url = food[:image_url]
                dateFood.yelpUrl = food[:url]
                dateFood.categories = food[:categories]
                dateFood.price=food[:price]
                dateFood.adress = food[:location][:display_address]
                dateFood.phone = food[:display_phone]
            end
            outing.activities << dateFood

            dateActivity=Activity.find_or_create_by(yelpID: params[:activity][:id])
            if dateActivity.name == nil
                dateActivity.name = activity[:name]
                dateActivity.img_url = activity[:image_url]
                dateActivity.yelpUrl = activity[:url]
                dateActivity.categories = activity[:categories]
                dateActivity.price=activity[:price]
                dateActivity.adress = activity[:location][:display_address]
                dateActivity.phone = activity[:display_phone]
            end
            outing.activities << dateActivity
            outing.save
            dateFood.save
            dateActivity.save
            render json: {status: 201}


    
        end

    end
end
