class Event < ApplicationRecord
  belongs_to :genre, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :title, length: { minimum: 4, maximum: 100 }, presence: true
  validates :date, presence: true
  validates :details, presence: true, length: { minimum: 10, maximum: 300 }
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
