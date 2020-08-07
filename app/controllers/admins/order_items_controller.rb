class Admins::OrderItemsController < ApplicationController


def update
 @order_item = OrderItem.find(params[:id])
 @order_item.update(order_item_params)


#製作ステータスが「製作中」なら注文ステータスを「製作中」に更新
# if @order_item.make_status == "製作中"
#   @order.update(order_status: 2)

# # 上記の条件に当てはまらなければ、商品の個数の特定製作ステータスが「製作完了」の商品をカウント。
# # 注文ステータスを「発送準備中]に更新
#   elsif @order.order_items.count ==  @order.order_items.where(make_status: "製作完了").count
# 		@order.update(order_status: 3)
#   end

   redirect_to admins_order_path(@order_item)

end




private

  def order_item_params
    params.require(:order_item).permit(:make_status)
  end



end
