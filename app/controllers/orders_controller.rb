class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def new
   @order = Order.new
   @companies = Company.all
  end

  def create
    order_params = params.require(:order).permit(:company_id, :recipient_name, :recipient_registration_number, :recipient_telephone,
                                                 :recipient_email, :recipient_address, :recipient_postal_code, :recipient_city, 
                                                 :recipient_state, :product_code, :product_length, :product_height, :product_width, 
                                                 :product_weight, :address, :postal_code, :city, :state)
    @order = Order.new(order_params)
  
   if @order.save()
     redirect_to @order, notice:'Ordem de serviço registrada com sucesso.'
    else
      @companies = Company.all
      flash.now[:alert]='Não foi possível gerar a ordem de serviço.'
      render 'new'
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end
end