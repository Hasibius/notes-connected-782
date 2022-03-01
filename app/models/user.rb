class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviewers, foreign_key: :reviewer_id, class_name: 'review'
  has_many :artists, foreign_key: :artist_id, class_name: 'review'

  validates :first_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :bio, length: { maximum: 600 }
  validates :username, presence: true, length: { minimum: 2 }, uniqueness: true, format: { with: /\A[\w\-@]*\z/ }
end
