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
  	 @member = Member.find(params[:id])
    if @member.update(member_params)
       flash[:notice] = "会員情報が更新されました"
       redirect_to admins_member_path(@member)
    else
      flash[:notice] = "会員情報の更新ができませんでした"
      render :edit
    end
  end

  def toggle
  	@member = Member.find(params[:id])

  	if @member.is_status?
  		  @member.is_status = false
  	else
  		  @member.is_status = true
  	end
        @member.save
        redirect_to edit_admins_member_path(@member)
  end


   private

  def member_params
    params.require(:member).permit(:is_status, :first_name, :first_name_kana, :last_name,:last_name_kana,:postcode,:address,:phone_number,:email)
  end


end
