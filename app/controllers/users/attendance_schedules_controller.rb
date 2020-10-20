class Users::AttendanceSchedulesController < ApplicationController

	def index #勤務表一覧（※日付の情報が必要になる）
		require 'date'
    day = Date.today
    start_date = Date::new(day.year,day.month, 1)
    end_date = start_date >> 1
    end_date = end_date - 1

    #今何年の取得
    year_name = start_date.year
    @year_name = year_name
    #今何月の取得
    month_name = start_date.month
    @month_name =  month_name

    #今月の羅列
    (Date.parse("#{start_date}")..Date.parse("#{end_date}")).each do |date|
    @date = date
    @start_date = start_date
    @end_date = end_date
    end
	end

	def show #勤務表詳細（編集機能を兼ねる）
		@attendance_schedule = AttendanceSchedule.find(params[:id])
		@attendance_schedule = current_user
	end

	def edit #勤務表詳細（編集機能を兼ねる）
		@attendance_schedule = AttendanceSchedule.find(params[:id])
	end

	def create
		# @attendance = Attendance.new(working_day: Time.zone.today)
		current_user.attendances.create(working_day: Time.zone.today) do |attendance|
			attendance.attendance_schedules.new(arrive_time: Time.current)
			attendance.attendance_schedules.new(leave_time: Time.current)
		end
		redirect_to attendances_url
	end

	private
	  def attendance_schedule_params
	    params.require(:attendance_schedule).permit(:attendance_id,:working_day,:arrive_time,:leave_time,:break_start_time,:break_end_time)
	  end
end
