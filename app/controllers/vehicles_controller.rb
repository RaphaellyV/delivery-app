class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle_and_check_user, only: [:edit, :update]

  def index
    @vehicles = current_user.company.vehicles
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    vehicle_params
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.company = current_user.company

    if @vehicle.save()
      redirect_to vehicles_path, notice:'Veículo cadastrado com sucesso.'
    else
      flash.now[:alert]='Veículo não cadastrado.'
      render 'new'
    end
  end

  def edit; end

  def update
    vehicle_params
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path, notice: 'Veículo atualizado com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar o veículo.'
      render 'edit'
    end                                      
  end

  private

    def set_vehicle_and_check_user
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.company != current_user.company
          return redirect_to root_path
        end
    end

    def vehicle_params
      params.require(:vehicle).permit(:license_plate, :v_brand, :v_model, :v_year, :max_load)
    end
end