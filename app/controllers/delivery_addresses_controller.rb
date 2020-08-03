class DeliveryAddressesController < ApplicationController

#配送先一覧
  def index
   @member = current_member
   @delivery_address = DeliveryAddress.new
   @delivery_addresses = @member.delivery_addresses
  end


#配送先新規保存
  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.member_id = current_member.id
    if @delivery_address.save
      flash[:notice] = "新しい住所を登録しました"
      redirect_to delivery_addresses_path
    else 
      @member = current_member
      @delivery_addresses = @member.delivery_addresses
      render :index
    end
  end

#配送先削除
  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
     flash[:notice] = "登録した住所を削除しました。"
     redirect_to delivery_addresses_path
  end

#配送先編集
  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.member != current_member
    redirect_to delivery_addresses_path
    end
  end


#編集内容保存
  def update
  @delivery_address = DeliveryAddress.find(params[:id])

  if @delivery_address.update(delivery_address_params)
    redirect_to delivery_addresses_path
    flash[:notice]="更新しました。"
  else
   render :edit
  end
end



 private

  def delivery_address_params
    params.require(:delivery_address).permit(:postcode, :address, :name,:member_id)
  end

end