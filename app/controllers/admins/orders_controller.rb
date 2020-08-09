class Admins::OrdersController < ApplicationController
before_action :authenticate_admin!


def index

   @orders = Order.all.order(created_at: :desc) #全ての注文データーを上から注文順に表示して取得する。

  end


  def show

    @order = Order.find(params[:id]) #注文詳細の特定
    @order_items = @order.order_items #注文から紐付く商品の取得

  end



  def update
	  @order = Order.find(params[:id]) #注文詳細の特定
	  @order_items = @order.order_items #注文から紐付く商品の取得
	  @order.update(order_params) #注文ステータスの更新

 	if @order.order_status == "入金確認" #注文ステータスが入金確認なら下の事をする
	     @order_items.update_all(make_status: 1) #製作ステータスを「製作待ちに」更新
	     end
  		  redirect_to admins_order_path(@order) #注文詳細に遷移
  end


private

  def order_params
  	params.require(:order).permit(:order_status,:name,:postcode,:address,:is_payment_method,:postage,:total_price,:created_at, :update_at,
      order_items_attributes: [:order_id, :item_id, :quantity, :purchase_price, :make_status]
      )
  end


end
