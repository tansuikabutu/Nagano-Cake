class ItemsController < ApplicationController
  def index
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
      .page(params[:page]).per(16).reverse_order

      @item_genre = @items.first.genre if @products.count > 0
    else
      # ジャンルが無効になっている商品は一覧に表示しない
      @items = Item
        .joins(:genre).where(genres: {active_status: "有効"})
        .page(params[:page]).per(16).reverse_order
    end
    @genres = Genre.all
  end


  def show
  	@item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
    @genres = Genre.all
  end
end
