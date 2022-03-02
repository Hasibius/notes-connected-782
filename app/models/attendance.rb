class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id, scope: :event_id, message: "cannot attend to the same event twice 🤷"
end
