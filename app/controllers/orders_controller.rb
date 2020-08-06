class OrdersController < ApplicationController
  def entry
    @order = current_member.orders.build(set_order)
    @order.postcode.insert(3, "-") if @order.postcode.present? # 郵便番号をハイフンありのフォーマットに変更（破壊的に変更）
    case params[:delivery_address_type]
    when "ご自身の住所"
      @order.postcode = current_member.postcode
      @order.delivery_address = current_member.address
      @order.delivery_name = current_member.last_name + current_member.first_name
    when "登録済住所から選択"
      @order.postcode = Delivery.find(set_delivery[:id]).postcode
      @order.delivery_address = Delivery.find(set_delivery[:id]).address
      @order.delivery_name = Delivery.find(set_delivery[:id]).name
    when "新しいお届け先"
  end

  def check
  end

  def index
    # 現在ログインしている会員が注文したもの(新しいもの順)
    @orders = Order.all
  end

  def new
    @order = Order.new
    @delivery = Delivery.new
  end

  # 請求金額の計算と格納
    @order.payment = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + @order.postage
    # オーダーの検証
    unless @order.valid?
      @delivery = Delivery.new
      render :new
    end
  end

  def create
    @order = current_member.orders.build(set_order)
    if @order.save!
      current_member.cart_items.each do |cart_item|
        # 注文商品テーブルにレコードを追加する
        @order_items = OrderItem.new(
          item_id: cart_item.item.id,
          count: cart_item.count,
          ordered_price: cart_item.item.price_with_tax,
          order_id: @order.id)
          @order_items.save!
        end
        Delivery.create!(member_id: current_member.id, zip_code: @order.zip_code, address: @order.delivery_address, name: @order.delivery_name)
        # オーダー確定後ユーザーのカートを削除する
        current_member.cart_items.destroy_all
     end
     redirect_to thanks_orders_path
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def thanks
  end

  private
  def set_order
    params.require(:order).permit(:total_price, :is_payment_method, :address, :postcode, :name)
  end
  def set_delivery
    params.require(:order).require(:delivery).permit(:id)
  end
end
