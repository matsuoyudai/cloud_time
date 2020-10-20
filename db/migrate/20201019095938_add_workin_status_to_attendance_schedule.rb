class AddWorkinStatusToAttendanceSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_schedules, :working_status, :integer
  end
end
