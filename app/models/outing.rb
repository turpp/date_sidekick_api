class Outing < ApplicationRecord
  belongs_to :user
  has_many :activities through: :date_activity
end
