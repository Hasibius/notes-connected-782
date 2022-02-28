class Review < ApplicationRecord
  belongs_to :reviewer, foreign_key: :reviewer_id, class_name: 'User'
  belongs_to :artist, foreign_key: :artist_id, class_name: 'User'
end
