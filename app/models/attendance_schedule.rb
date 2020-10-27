class AttendanceSchedule < ApplicationRecord
	belongs_to :user
	validates :user_id, uniqueness: {scope: :working_day}

	enum working_status: {出勤: 0, 休暇: 1}
end
