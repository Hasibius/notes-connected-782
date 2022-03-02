class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :artist, class_name: "User"

  validates_uniqueness_of :follower_id, scope: :artist_id, message: "cannot follow the same person twice 🤷"
end
