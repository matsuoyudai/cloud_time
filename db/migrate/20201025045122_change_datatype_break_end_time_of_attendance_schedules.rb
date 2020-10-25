class ChangeDatatypeBreakEndTimeOfAttendanceSchedules < ActiveRecord::Migration[5.2]
  def change
  	change_column :attendance_schedules, :break_end_time, :datetime
  end
end
