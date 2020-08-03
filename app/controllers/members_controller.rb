class MembersController < ApplicationController
    before_action :authenticate_member!
    before_action :baria_member, only: [:edit,:update,:unsubscribe]

  def edit
  end

  def show
  end

  def unsubscribe
  end

  def udpate
    @member = current_member
    if @member.update(member_params)
       redirect_to member_path(@member), success: "会員情報が更新されました"
    else
      flash[:danger] = "会員情報の更新ができませんでした"
      render :edit
    end
  end

  def unsubscribe_done
    @member = current_member
    @customer.update(is_status: false)
    reset_session
    redirect_to member_top_path, info: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end


  private
  def member_params
    params.require(:member).permit(:is_status, :first_name, :first_name_kana, :last_name,:last_name_kana,:postcode,:address,:phone_number,:email)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動。
  def baria_member
    unless params[:id].to_i == current_member.id
      redirect_to member_path(current_member)
    end
  end


end
