class ItemsController < ApplicationController
  def index
    @items = Item.where(is_status: true).page(params[:page]).per(8) # where文で販売ステータスが販売中のものだけ表示させる/ページネーションの追加/8件ごとにページ作成
    @quantity = Item.count # quantity => 総量/.count =>カウントメソッド、配列の要素の数を数えるための機能
    @genres = Genre.where(is_status: 0)# ジャンルが有効のみ
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  # ジャンル検索機能
  def search
    @items = Item.where(genre_id: params[:format]).page(params[:page]).per(8) # パラメーターで渡ってきたジャンルidを元に、Item内のgenre_idと完全一致する商品情報を取得している。
    @quantity = Item.where(genre_id: params[:format]).count # 検索してきたジャンルの商品数をカウント
    @genres = Genre.where(is_status: 0)
    render 'index'
  end
end