class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :artist, class_name: "User"
end
