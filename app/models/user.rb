class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
  length: {maximum: 20}
  validates :name_kana, presence: true,
  length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, allow_blank: true
  validates :email, presence: true
  has_many :attendance_schedules, dependent: :destroy
  has_many :applies, dependent: :destroy
end
