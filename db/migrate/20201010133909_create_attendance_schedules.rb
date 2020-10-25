class CreateAttendanceSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_schedules do |t|
      t.integer :user_id
      t.date :working_day
      t.time :arrive_time
      t.time :leave_time
      t.time :break_start_time
      t.time :break_end_time

      t.timestamps
    end
  end
end
