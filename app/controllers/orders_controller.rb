class OrdersController < ApplicationController
  #管理者とログインユーザーのみ閲覧可
  before_action :authenticate_member!
  before_action :set_member

  def index
    @orders = @member.orders
  end

  def create
   if current_member.cart_items.exists?
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.postage = 800

      # addressで住所モデル検索、該当データなければ新規作成
      if DeliveryAddress.find_by(address: @order.address).nil?
        @address = DeliveryAddress.new
        @address.postcode = @order.postcode
        @address.address = @order.address
        @address.name = @order.name
        @address.member_id = current_member.id
        @address.save
      end

      # cart_itemsの内容をorder_itemsに新規登録
      current_member.cart_items.each do |cart_item|
        order_item = @order.order_items.build
        order_item.order_id = @order.id
        order_item.item_id = cart_item.item_id
        order_item.quantity = cart_item.quantity
        order_item.perchase_price = cart_item.item.price*1.1
        order_item.save
        cart_item.destroy #order_itemに情報を移したらcart_itemは消去
      end
      render :thanks
    else
      redirect_to member_top_path
    flash[:danger] = 'カートが空です。'
    end
   end



  def entry
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_member.cart_items
    

    #ボタン選択で引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postcode = @member.postcode
        @order.address = @member.address
        @order.name = @member.last_name + @member.first_name
      when 2
        @da = params[:order][:delivery_address].to_i
        @address = DeliveryAddress.find(@da)
        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name
      when 3
        @order.postcode = params[:order][:new_add][:postcode]
        @order.address = params[:order][:new_add][:address]
        @order.name = params[:order][:new_add][:name]
    end
  end

  def index
    # 現在ログインしている会員が注文したもの(新しいもの順)
    @orders = current_member.orders.order("created_at DESC")
  end

  def new
    @order = Order.new

  end



  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def thanks
  end

  private

  def set_member
    @member = current_member
  end

  def order_params
    params.require(:order).permit(:member_id,
      :postage, :total_price, :is_payment_method, :postcode, :address, :name, :status, :created_at, :update_at,
      order_items_attributes: [:order_id, :item_id, :quantity, :purchase_price, :make_status]
      )
  end

end
