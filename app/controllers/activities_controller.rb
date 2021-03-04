require 'yelp/fusion'
class ActivitiesController < ApplicationController
@@KEY='98NIBCJIciAPgPo1Qdn558i-1lKmM3j1FTAaVfauX3cYvhZPJVDRi63_WIMwKe2ojqsSqSqxkFg3Jf2t8Va52w1lemMFauj51kftEd582ZklUgEroI2SqQyRLVQ1YHYx'
@@client = Yelp::Fusion::Client.new(@@KEY)

    def findActivity
        response=@@client.search(params[:zipcode], term: 'food')
        render json: response
    end

    def findFoodActivity
        foodResponse=@@client.search(params[:zipcode], term: 'food')
        activityResponse=@@client.search(params[:zipcode], term: 'things-to-do')
        render json: {food: foodResponse, activity: activityResponse}
    end
end
