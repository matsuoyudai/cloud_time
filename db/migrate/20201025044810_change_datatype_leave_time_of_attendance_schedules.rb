class ChangeDatatypeLeaveTimeOfAttendanceSchedules < ActiveRecord::Migration[5.2]
  def change
  	change_column :attendance_schedules, :leave_time, :datetime
  end
end
