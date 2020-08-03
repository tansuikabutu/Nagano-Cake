class Admins::GenresController < ApplicationController

  def index
  	@genres = Genre.all #Genreモデルからすべてのインスタンス取得
    @genre = Genre.new # 新規投稿用の空のインスタンス
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params) # フォームから送られてきたデータ(body)をストロングパラメータを経由して@genreに代入
    if @genre.save
      redirect_to admins_genres_path, notice: "You have created genre successfully."
    else
      render 'index'
    end
  end

  def update
  	@genre = Genre.find(params[:id])
    if @genre.update(genre_params)
     redirect_to admins_genres_path, notice: "You have updated genre successfully."
    else
      render "edit"
    end
  end

 private

  def genre_params
    params.require(:genre).permit(:name, :is_status)
  end

end
