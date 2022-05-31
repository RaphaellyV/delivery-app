class PricesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_price_and_check_user, only: [:edit, :update]

  def index
    @prices = current_user.company.prices
  end

  def new
    @price = Price.new
  end

  def create
    price_params
    @price = Price.new(price_params)
    @price.company = current_user.company

    if @price.save()
      redirect_to prices_path, notice:'Preço cadastrado com sucesso.'
    else
      flash.now[:alert]='Preço não cadastrado.'
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

    def set_price_and_check_user
        @price = Price.find(params[:id])
        if @price.company != current_user.company
          return redirect_to root_path
        end
    end

    def price_params
      params.require(:price).permit(:min_vol, :max_vol, :min_weight, :max_weight, :price_per_km)
    end
end