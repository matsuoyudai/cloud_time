class ChangeDatatypeBreakStartTimeOfAttendanceSchedules < ActiveRecord::Migration[5.2]
  def change
  	change_column :attendance_schedules, :break_start_time, :datetime
  end
end
