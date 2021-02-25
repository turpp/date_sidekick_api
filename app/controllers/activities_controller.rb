require 'yelp/fusion'
class ActivitiesController < ApplicationController
@@KEY='98NIBCJIciAPgPo1Qdn558i-1lKmM3j1FTAaVfauX3cYvhZPJVDRi63_WIMwKe2ojqsSqSqxkFg3Jf2t8Va52w1lemMFauj51kftEd582ZklUgEroI2SqQyRLVQ1YHYx'
@@client = Yelp::Fusion::Client.new(@@KEY)


    def findActivity
        # byebug
        response=@@client.search(params[:zipcode], term: params[:type])
        # byebug
        render json: response

    end
end
