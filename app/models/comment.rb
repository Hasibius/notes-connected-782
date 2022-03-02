class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy

  validates :content, presence: true, length: { minimum: 2, maximum: 100 }
end
