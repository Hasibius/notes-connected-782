class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :artist, class_name: "User"
end
