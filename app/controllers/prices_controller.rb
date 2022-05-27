class PricesController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user
  end
  before_action :set_price, only: [:edit, :update]

  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
  end

  def create
    price_params
    @price = Price.new(price_params)

    if @price.save()
      redirect_to prices_path, notice:'Preço cadastrado com sucesso.'
    else
      flash.now[:notice]='Preço não cadastrado.'
      render 'new'
    end
  end

  def edit; end

  def update
    price_params
    if @price.update(price_params)
      redirect_to prices_path, notice: 'Preço atualizado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar o preço.'
      render 'edit'
    end                                      
  end
  
  private

    def set_price
        @price = Price.find(params[:id])
    end

    def price_params
      params.require(:price).permit(:min_vol, :max_vol, :min_weight, :max_weight, :price_per_km)
    end
end