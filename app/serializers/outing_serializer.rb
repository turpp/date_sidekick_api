class OutingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :notes, :user_id, :activities
end
