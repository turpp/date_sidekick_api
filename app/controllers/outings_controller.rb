class OutingsController < ApplicationController

    def create
        user = User.find_by(id: params[:user][:id])

        if params[:type]=='food'
        outing=Outing.new()
        outing.user=user
        activity=Activity.get_outing_food(params)
        outing.activities << activity
        outing.save
        render json: {status: 201}
        end

        if params[:type]=='foodActivity'
            outing=Outing.new()
            outing.user=user
            dateFood=Activity.get_outing_food(params)
            outing.activities << dateFood
            dateActivity=Activity.get_outing_activity(params)
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
