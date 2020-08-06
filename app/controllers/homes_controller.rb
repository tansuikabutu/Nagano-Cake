class HomesController < ApplicationController
  def about
  end

  def top
  	@items = Item.limit(8).offset(4)
  	@genres = Genre.where(is_status: "有効")
  end
end
