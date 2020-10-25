class Admins::UsersController < ApplicationController

	def index #ユーザー一覧画面
		@users = User.page(params[:page]).per(10)
	end

	def show #ユーザー詳細画面（勤務表）
	end

	private

	def user_params
    params.require(:user).permit(:name,:name_kana,:email)
  end
end
