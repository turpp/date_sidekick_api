class OutingsController < ApplicationController

    def create
        user = User.find_by(id: params[:user][:id])

        if params[:type]=='food'
        food=params[:food]
        outing=Outing.new()
        outing.user=user
        activity=Activity.find_or_create_by(yelpID: params[:food][:id])
        if activity.name == nil
            activity.categories = food[:categories]
            activity.location = food[:location]
            activity.update(food_params)
        end
        outing.activities << activity
        outing.save
        render json: {status: 201}
        end

        if params[:type]=='foodActivity'
            food=params[:food]
            activity=params[:activity]
            outing=Outing.new()
            outing.user=user
            dateFood=Activity.find_or_create_by(yelpID: params[:food][:id])
            if dateFood.name == nil
                dateFood.categories = food[:categories]
                dateFood.location = food[:location]
                dateFood.update(food_params)
            end
            outing.activities << dateFood
            dateActivity=Activity.find_or_create_by(yelpID: params[:activity][:id])
            if dateActivity.name == nil
                dateActivity.categories = activity[:categories]
                dateActivity.location = activity[:location]
                dateActivity.update(activity_params)
            end
            outing.activities << dateActivity
            outing.save
            render json: {status: 201}
        end
    end

    def update
        outing=Outing.find_by(id: params[:id])
        outing.update(outing_params)
        render json: {status: 201}
    end

    def destroy
        outing=Outing.find_by(id: params[:id])
        outing.destroy
        render json: {status: 204}
    end

    private

    def outing_params
        params.require(:outing).permit(:notes, :date)
    end

    def food_params
        params.require(:food).permit(:name, :image_url, :url, :categories, :price, :location, :display_phone)
    end

    def activity_params
        params.require(:activity).permit(:name, :image_url, :url, :categories, :price, :location, :display_phone)
    end
end
