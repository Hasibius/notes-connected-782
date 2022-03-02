class Attendance < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy

  validates_uniqueness_of :user_id, scope: :event_id, message: "cannot attend to the same event twice 🤷"
end
