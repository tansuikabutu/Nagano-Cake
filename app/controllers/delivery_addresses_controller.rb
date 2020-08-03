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
      flash[:success] = "新しい住所を登録しました"
      redirect_to delivery_addresses_path
    else 
      @member = current_user
      @delivery_addresses = @member.delivery_addresses
      render :index
    end
  end


  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
     flash[:success] = "登録した住所を削除しました。"
     redirect_to delivery_addresses_path
  end


  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.member != current_member
    redirect_to delivery_addresses_path
    end
  end



  def update

  end




 private


  def delivery_address_params
    params.require(:delivery_address).permit(:postcode, :address, :name,:member_id)
  end

end