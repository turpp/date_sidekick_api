class User < ApplicationRecord
    has_secure_password
    has_many :outings
    has_many :activities, through: :outings

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true


end
