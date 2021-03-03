class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username

  has_many :outings
  has_many :activities
end
