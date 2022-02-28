class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :artist, class_name: "User"

  validates :comment, length: { maximum: 300 }
  validates :score, numericality: { only_integer: true }
end
