class OutingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :notes, :user_id, :activities
end
