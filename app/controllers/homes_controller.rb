class HomesController < ApplicationController
  def about
  end

  def top
  	@genres = Genre.all # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
    @items = Item.limit(3)
  end
end