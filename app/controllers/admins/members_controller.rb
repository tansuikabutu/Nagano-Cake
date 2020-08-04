class Admins::MembersController < ApplicationController
  #ログインユーザーのみ
  before_action :authenticate_admin!

  def index
  	@members = Member.all
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def update
  end

   private

  def member_params
    params.require(:member).permit(:is_status, :first_name, :first_name_kana, :last_name,:last_name_kana,:postcode,:address,:phone_number,:email)
  end


end
