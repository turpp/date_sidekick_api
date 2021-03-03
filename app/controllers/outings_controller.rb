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
            activity.image_url = food[:image_url]
            activity.url = food[:url]
            activity.categories = food[:categories]
            activity.price=food[:price]
            activity.location = food[:location]
            activity.display_phone = food[:display_phone]
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
                dateFood.image_url = food[:image_url]
                dateFood.url = food[:url]
                dateFood.categories = food[:categories]
                dateFood.price=food[:price]
                dateFood.location = food[:location]
                dateFood.display_phone = food[:display_phone]
            end
            outing.activities << dateFood

            dateActivity=Activity.find_or_create_by(yelpID: params[:activity][:id])
            if dateActivity.name == nil
                dateActivity.name = activity[:name]
                dateActivity.image_url = activity[:image_url]
                dateActivity.url = activity[:url]
                dateActivity.categories = activity[:categories]
                dateActivity.price=activity[:price]
                dateActivity.location = activity[:location]
                dateActivity.display_phone = activity[:display_phone]
            end
            outing.activities << dateActivity
            outing.save
            dateFood.save
            dateActivity.save
            render json: {status: 201}


    
        end

    end

    def destroy
        outing=Outing.find_by(params[:id])
        outing.destroy


    end
end
