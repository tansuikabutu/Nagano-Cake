class Admins::OrderItemsController < ApplicationController
 before_action :authenticate_admin!

def update

 @order_item = OrderItem.find(params[:id]) #注文商品の取得
 @order = @order_item.order  #注文商品から注文テーブルの呼び出し
 @order_item.update(order_item_params)

	if @order_item.make_status == "製作中"  #製作ステータスが「製作作中」なら入る
	   @order.update(order_status: 2) #注文ステータスを「製作中」に更新

 elsif @order_item.make_status == "製作完了"   #製作ステータスが「製作完了」なら入る
    @order.update(order_status: 3) #注文ステータスを「発送準備中」に更新
  end
 
   redirect_to admins_order_path(@order) #注文詳細に遷移


end





private

  def order_item_params
    params.require(:order_item).permit(:make_status)
  end



end
