class Activity < ApplicationRecord
    has_many :outing_activities

    has_many :outings, through: :outing_activities
    serialize :categories
    serialize :location

    # need to get my activity and outings realtionships to work
    
    
    
    
end





