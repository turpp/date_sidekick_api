class Activity < ApplicationRecord
    has_many :outings, through: :date_activity
end

