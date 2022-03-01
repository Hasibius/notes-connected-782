class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviewers, foreign_key: :reviewer_id, class_name: 'review'
  has_many :artists, foreign_key: :artist_id, class_name: 'review'
  has_one_attached :photo

  validates :first_name, length: { minimum: 2, maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, length: { minimum: 2, maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :bio, length: { maximum: 600 }
  validates :user_name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true,
                        format: { with: /[\w\-@ ]*/ }
  validate :check_photo_content_type

  private

  def check_photo_content_type
    # it's optional to upload a photo
    return unless photo.key

    errors.add :photo, 'allows only jpeg, jpg or png files' unless photo.content_type.match(%r{\A.+/(png|jpe?g)$\z})
  end
end
