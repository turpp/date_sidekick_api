class User < ApplicationRecord
    has_secure_password
    has_many :outings
    has_many :activities, through: :outings

end
