class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, presence: true, length: { minimum: 2, maximum: 100 }
end
