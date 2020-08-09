class Admins::HomesController < ApplicationController
  def top

  	@orders = Order.where(created_at: Time.now.in_time_zone.all_day) #本日の注文データーを取得

  end
end
