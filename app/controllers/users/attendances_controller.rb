class Users::AttendancesController < ApplicationController
	before_action :authenticate_user!

	def index #勤怠ページ
		# @attendance = Attendance.today(current_user)
	end

	def create
	  @attendance = Attendance.today(current_user)

	  if params[:in]
	    @attendance.arrive_time = Time.now
	  elsif params[:out]
	    @attendance.leave_time = Time.now
	  end
	end



end