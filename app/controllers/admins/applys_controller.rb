class Admins::ApplysController < ApplicationController
	before_action :authenticate_admin!

	def index #申請一覧
		@applys = Apply.all
		# @applys = Apply.find(params[:id]).per(10)
	end

	def show #申請詳細画面
		@apply = Apply.find(params[:id])
	end

	def approve #申請の承認
	end

end
