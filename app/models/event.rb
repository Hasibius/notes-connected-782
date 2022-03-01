class Event < ApplicationRecord
  belongs_to :genre

  validates :title, length: { minimum: 4, maximum: 100 }, presence: true
  validates :date, presence: true
  validates :details, presence: true, length: { maximum: 300 }
end
