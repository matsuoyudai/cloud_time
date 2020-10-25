class Attendance < ApplicationRecord
	belongs_to :user
	has_one :attendance_schedule, dependent: :destroy

	validates :user_id, uniqueness: {scope: :working_day}
end
