class CartItemsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_cart_item, only: [:show, :update, :destroy, :edit]
  before_action :set_member


  def index
    # 会員がカートに入れた商品全て
   @cart_items = @member.cart_items.all
  end

  def create
    # こう記述することで、「current_memberに関連したCartItemクラスの新しいインスタンス」が作成可能。
    # つまり、cart_items.member_id = current_member.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    @cart_item = current_member.cart_items.build(cart_item_params)
    # 商品idがカートアイテムに関連した商品id、会員idがカートアイテムに関連した会員id の条件に合うデータを若い順に１つだけ取得
    @current_item = CartItem.find_by(item_id: @cart_item.item_id,member_id: @cart_item.member_id)
    # カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    if @current_item.nil?
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to cart_items_path
      else
        @carts_items = @member.cart_items.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
    else
      # 現在のカートアイテムの個数 + ? 数字の文字列を数値オブジェクトに変換するメソッド
      @current_item.quantity += params[:quantity].to_i
      @current_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
      flash[:success] = 'カート内の商品を更新しました！'
    end
  end

  def destroy
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

  def set_member
    @member = current_member
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :member_id, :quantity)
  end
end
