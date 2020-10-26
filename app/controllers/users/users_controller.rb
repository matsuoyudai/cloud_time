class Users::UsersController < ApplicationController

	def index #ユーザーのアカウントページ（編集機能を兼ねる）
		@user = current_user
		@user = User.find(current_user.id)
	end

	def update #ユーザーのアカウント登録情報更新
		@user = current_user
		if @user.update(user_params)
      		redirect_to attendances_path
    	else
      		render 'index'
    	end
	end

	private
    # ストロングパラメータ
    def user_params
      params.require(:user).permit(:name, :name_kana, :email,:password, :password_confirmation)
    end

end
