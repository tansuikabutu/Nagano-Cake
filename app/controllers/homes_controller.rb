class HomesController < ApplicationController
  def about
  end

  def top
  	@genres = Genre.all # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
    @items = Item.limit(3)

    if admin_signed_in?
      redirect_to admins_top_path # ログイン済みのトップ画面
    else
      render 'top' # ログインしてないトップ画面
    end
  end
end