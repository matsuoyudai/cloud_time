class AttendanceSchedule < ApplicationRecord
	belongs_to :attendance
	enum working_status: {出勤: 0, 休暇: 1}
end
