class Admins::OrdersController < ApplicationController


   def index
    @path = Rails.application.routes.recognize_path(request.referer)
    if @path[:controller] == "admin/members" && @path[:action] == "show"
       @order = Order.where(member_id: params[:format]).page(params[:page]).per(7)
    elsif @path[:controller] == "admin/admins"
       @order = Order.where(created_at: Time.zone.today.all_day).page(params[:page]).per(7)
    else
       @order = Order.page(params[:page]).per(7)
    end

  end


  def show

  end

  def update


  end




private

  def order_params
  	params.require(:order).permit(:order_status)
  end



end
