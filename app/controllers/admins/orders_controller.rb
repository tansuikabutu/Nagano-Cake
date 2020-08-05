class Admins::OrdersController < ApplicationController





def index
	# 遷移元(直前)のcontrollerやaction名を取得する
    @path = Rails.application.routes.recognize_path(request.referer)
     # 指定したcontrollerとaction名が正しい時、与えられた条件にマッチするものを取得する。
    if @path[:controller] == "admin/members" && @path[:action] == "show"
       @orders = Order.where(member_id: params[:format]).page(params[:page]).per(7)
    elsif @path[:controller] == "admin/admins"
       @orders = Order.where(created_at: Time.zone.today.all_day).page(params[:page]).per(7)
    else
       @orders = Order.page(params[:page]).per(7)
    end
  end




  def show

    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end



  def update
	  @order = Order.find(params[:id]) #注文詳細の特定
	  @order_items = @order.order_items #注文から紐付く商品の取得
	  @order.update(order_params) #注文ステータスの更新

 	if @order.order_status == "入金確認" #注文ステータスが入金確認なら下の事をする
	     @order_items.update_all(make_status: 1) #製作ステータスを「製作待ちに」　更新
	     end
  		  redirect_to  admin_order_path(@order) #注文詳細に遷移
  end




private

  def order_params
  	params.require(:order).permit(:order_status)
  end



end
