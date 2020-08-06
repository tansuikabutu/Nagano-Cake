class HomesController < ApplicationController
  def about
  end

  def top
  	@items = Item.all
  	@genres = Genre.where(is_status: "false")
  end
end
