class Event < ApplicationRecord
  belongs_to :genre, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_one_attached :photo

  validates :title, length: { minimum: 4, maximum: 100 }, presence: true
  validates :date, presence: true
  validates :details, presence: true, length: { minimum: 10, maximum: 300 }
  validates :address, presence: true
  validates :photo, presence: true
  validate :check_photo_content_type
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def check_photo_content_type
    # it's optional to upload a photo
    return unless photo.key

    errors.add :photo, 'allows only jpeg, jpg or png files' unless photo.content_type.match(%r{\A.+/(png|jpe?g)$\z})
  end
end
