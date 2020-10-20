class Attendance < ApplicationRecord
	belongs_to :user
	has_many :attendance_schedules, dependent: :destroy
end
