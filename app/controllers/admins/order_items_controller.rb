class Admins::OrderItemsController < ApplicationController


def update
 @order_item = OderItem.find(params[:id])
 @order = @order_item.order
 @order_item.update(order_item_params)


if @order_item.make_status == "製作中"
  @order.update(order_status: 2)
 end

end





private

  def order_item_params
    params.require(:order_item).permit(:make_status)
  end




end
