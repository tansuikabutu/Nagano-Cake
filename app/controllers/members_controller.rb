class MembersController < ApplicationController
    before_action :authenticate_member!
  def edit
    @member = Member.find(current_Member.id)

  end

  def show
    @member = Member.find(current_Member.id)
  end

  def unsubscribe
    @member = Member.find(current_Member.id)
    if @member.update!(admittion_status: "")

      redirect_to members_sign_out_path
    end
  end

  def udpate
  end

  def unsubscribe_done
  end

  def member_params
    params.require(:member).permit(:is_status, :first_name, :first_name_kana, :last_name,:last_name_kana,:postcode,:address,:phone_number,:email)
  end


end
