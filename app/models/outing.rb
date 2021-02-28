class Outing < ApplicationRecord
  belongs_to :user
  has_many :outing_activities
  has_many :activities, through: :outing_activities
end
