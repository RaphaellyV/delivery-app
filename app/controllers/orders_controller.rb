class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  before_action :set_order_and_check_user, only: [:accepted, :refused, :delivered]

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

  def search
    @tracking_code = params['query']
    @order = Order.find_by(tracking_code: @tracking_code)
  end

  def accepted
    @order.accepted!
    redirect_to @order
  end

  def refused
    @order.refused!
    redirect_to @order
  end

  def delivered
    @order.delivered!
    redirect_to @order
  end

  private

  def set_order_and_check_user
    @order = Order.find(params[:id])
    if @order.company != current_user.company
      return redirect_to root_path
    end
  end
end