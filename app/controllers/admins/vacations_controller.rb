class Admins::VacationsController < ApplicationController
	before_action :authenticate_admin!

	def index #休暇一覧画面（追加を兼ねる）
		@vacations = Vacation.all
    @vacation = Vacation.new
	end

	def create #休暇データ登録
		@vacation = Vacation.new(vacation_params)
    if  @vacation.save
      redirect_to admins_vacations_path
    else
      flash[:vacations_created_error] = "休暇名を入力してください。"
      redirect_to
    end
	end

	def destroy
		@vacation = Vacation.find(params[:id])
        @vacation.destroy
        redirect_to admins_vacations_path
    end

	private
  def vacation_params
    params.require(:vacation).permit(:name)
  end
end
