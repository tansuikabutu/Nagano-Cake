class Admins::ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
    @items = Item.page(params[:page]).per(10)
    @quantity = Item.count
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @genre =Genre.find(@item.genre_id)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to admins_items_path(@item)
    else
       render "new"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path(@item.id)
    else
      render "edit"
    end
  end

  def item_params
    params.require(:item).permit(:genre_id,:name,:price,:is_status,:introduction,:image_id)
  end
end
