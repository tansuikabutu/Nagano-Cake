class Admins::GenresController < ApplicationController
 before_action :authenticate_admin!

  def index
  	@genres = Genre.all #Genreモデルからすべてのインスタンス取得
    @genre = Genre.new # 新規投稿用の空のインスタンス
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params) # フォームから送られてきたデータ(body)をストロングパラメータを経由して@genreに代入
    @genre.save
    redirect_to admins_genres_path
  end

  def update
  	@genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admins_genres_path
  end

 private

  def genre_params
    params.require(:genre).permit(:name, :is_status)
  end

end
