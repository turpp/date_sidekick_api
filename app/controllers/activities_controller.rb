require 'yelp/fusion'
class ActivitiesController < ApplicationController
@@KEY=ENV["YELP_API_KEY"]
@@client = Yelp::Fusion::Client.new(@@KEY)

    def findActivity
        # byebug
        response=@@client.search(params[:zipcode], term: 'food')
        render json: response
    end

    def findFoodActivity
        foodResponse=@@client.search(params[:zipcode], term: 'food')
        activityResponse=@@client.search(params[:zipcode], term: 'things-to-do')
        render json: {food: foodResponse, activity: activityResponse}
    end
end
