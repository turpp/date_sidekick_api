class Activity < ApplicationRecord
    has_many :outing_activities

    has_many :outings, through: :outing_activities


    # need to get my activity and outings realtionships to work
    
    
    
    
end





