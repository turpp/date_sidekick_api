class Activity < ApplicationRecord
    has_many :outing_activities

    has_many :outings, through: :outing_activities
    serialize :categories
    serialize :location

    def save_location_and_categories(params)
        self.categories = params[:categories]
        self.location = params[:location]
    end
    
    def self.get_outing_food(params)
        activity=Activity.find_or_create_by(yelpID: params[:food][:id])
        if activity.name == nil
            activity.save_location_and_categories(params[:food])
            activity.update(params.require(:food).permit(:name, :image_url, :url, :categories, :price, :location, :display_phone))
        end
        activity
    end
    
    def self.get_outing_activity(params)
        dateActivity=Activity.find_or_create_by(yelpID: params[:activity][:id])
        if dateActivity.name == nil
            dateActivity.save_location_and_categories(params[:activity])
            dateActivity.update(params.require(:activity).permit(:name, :image_url, :url, :categories, :price, :location, :display_phone))
        end
        dateActivity
    end


    
end





