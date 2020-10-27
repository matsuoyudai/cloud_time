class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest #ゲストログイン
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.name_kana = "げすと"
      user.password = SecureRandom.urlsafe_base64
    end
  end

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
