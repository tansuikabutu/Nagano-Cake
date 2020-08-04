class CartItemsController < ApplicationController

#ログインユーザーのみ閲覧可
  before_action :authenticate_member!


  def index
   @cart_items = current_member.cart_items.all

  end


  # def create
  #  @cart_item = current_member.cart_items.build(cart_item_params)
  #  @current_item = CartItem.find_by(item_id: @cart_item.item_id,member_id: @cart_item.member_id)
  #  if @current_item.nil
  #   if @cart_item.save
  #       flash[:success] = 'カートに商品が追加されました！'
  #       redirect_to cart_items_path
  #   else
  #       @carts_items = @member.cart_items.all
  #       render 'index'
  #       flash[:danger] = 'カートに商品を追加できませんでした。'
  #     end
  #   else
  #      @current_item.quantity += params[:quantity].to_i
  #      @current_item.update(cart_item_params)
  #      redirect_to cart_items_path
  #   end
  # end

def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.member_id = current_member.id
    @cart_items.price = @cart_item.item.price * @cart_item.quantity
    @cart_item.save
    redirect_to cart_items_path
  end






  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
      flash[:success] = 'カート内の商品を更新しました！'
     end
   end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    flash[:info] = 'カートの商品を取り消しました。'
  end


  def destroy_all
    @member.cart_items.destroy_all
    redirect_to cart_items_path
    flash[:info] = 'カートを空にしました。'
  end


private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :member_id, :quantity)
  end




end
