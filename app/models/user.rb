class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviewers, foreign_key: :reviewer_id, class_name: 'review'
  has_many :artists, foreign_key: :artist_id, class_name: 'review'
  has_many :attends, through: :attendances

  validates :first_name, length: { minimum: 2, maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :last_name, length: { minimum: 2, maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :bio, length: { maximum: 600 }
  validates :user_name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true, format: { with: /[\w\-@ ]*/ }

  def attends
    Attendance.where(user: self).map do |user_attendance|
      user_attendance.event
    end.uniq
  end
end
