class ChangeDatatypeArriveTimeOfAttendanceSchedules < ActiveRecord::Migration[5.2]
  def change
  	change_column :attendance_schedules, :arrive_time, :datetime
  end
end
