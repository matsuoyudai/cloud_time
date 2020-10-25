class Users::AttendanceSchedulesController < ApplicationController
	before_action :authenticate_user!

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
    start_date = Time.now.beginning_of_month
   	end_date = Time.now.end_of_month
   	@attendance_schedule = AttendanceSchedule.select("*, strftime('%Y-%m-%d', arrive_time) as day").where(user_id: current_user.id, working_day: start_date..end_date)
   	#binding.pry
	end

	def new
		@attendance_schedule = AttendanceSchedule.new
	end

	def show #勤務表詳細（編集機能を兼ねる）
		@attendance_schedule = AttendanceSchedule.find(params[:id])
	end

	def create
		@attendance_schedule = AttendanceSchedule.new(user_id: current_user.id)
		@attendance_schedule.arrive_time = Time.zone.now
		@attendance_schedule.working_day = Time.now
		if @attendance_schedule.save!
			redirect_to attendances_url
		else
			redirect_to attendances_url, notice:"すでに出勤しています。"
		end

   	#attendance = current_user.attendances.new(working_day: Time.zone.today)
		#attendance_schedule = attendance.build_attendance_schedule(arrive_time: DateTime.now)
		#	if attendance.save
		#		redirect_to attendances_url
		#	else
		#		redirect_to attendances_url, notice:"すでに出勤しています。"
		#	end

		# @attendance_schedule = Attendance.new({user_id: current_user.id, working_day: attendance.id })
		# @attendance_schedule.save
		# attendance = Attendance.find_by({working_day: Date.today, user_id: current_user.id})
		# @attendance_schedule = AttendanceSchedule.new(attendance_schedule_params.merge({attendance_id: attendance.id, user_id: current_user.id }))
  	# @attendance_schedule.save ? (redirect_to attendance_schedules_path(@attendance_schedule)) : (render :new)
  end

	def create_attendance
		# @attendance = Attendance.new(working_day: Time.zone.today)
		# attendance = current_user.attendances.create!(working_day: Time.zone.today)
		# attendance_schedule = attendance.build_attendance_schedule(arrive_time: Time.current)
		@attendance_schedule.save!
		# redirect_to attendances_url
	end

	def leave
		@attendance_schedule = AttendanceSchedule.find(params[:id])
		@attendance_schedule.update!(leave_time: Time.zone.now)
		redirect_to attendances_url
	end

	def update
		@attendance_schedule = AttendanceSchedule.find(params[:id])
  	if @attendance_schedule.update(attendance_schedule_params)
  	  redirect_to "#{attendance_schedules_path}?date=#{@current_years}_path"
    else
      render 'show'
    end
	end

	private
	  def attendance_schedule_params
	    params.require(:attendance_schedule).permit(:arrive_time,:leave_time,:break_start_time,:break_end_time)
	  end
end
