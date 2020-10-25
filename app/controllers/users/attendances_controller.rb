class Users::AttendancesController < ApplicationController
	before_action :authenticate_user!

	def index #勤怠ページ
		# @attendance = Attendance.today(current_user)
		@attendance_schedule = current_user.attendance_schedules.find_by(working_day: Date.today)
		# @attendance_schedule = AttendanceSchedule.find(params[:datetime])
	end

	def create

	  @attendance = Attendance.today(current_user)

	  if params[:in]
	    @attendance.arrive_time = Date.now
	  elsif params[:out]
	    @attendance.leave_time = Date.now
	  end
	end



end