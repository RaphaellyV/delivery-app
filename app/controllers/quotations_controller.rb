class QuotationsController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    redirect_to root_path unless current_user.admin
  end

  def new
    @quotation = Quotation.new
  end

  def create
    quotation_params
    @quotation = Quotation.new(quotation_params)

    if @quotation.height != nil && @quotation.width != nil && @quotation.length != nil
      @quotation.volume = (@quotation.height * @quotation.width * @quotation.length)/1000000
    end

    if @quotation.save()
      redirect_to @quotation
    else
      flash.now[:alert] = 'Não foi possível gerar o orçamento.'
      render 'new'
    end
  end

  def show
    @quotation = Quotation.find(params[:id])
    @weight_kg = @quotation.weight / 1000
    @prices = Price.where("min_vol <= ? AND max_vol >= ?", @quotation.volume, @quotation.volume).where("min_weight <= ? AND max_weight >= ?", @weight_kg, @weight_kg)
    @deadlines = Deadline.where("min_distance <= ? AND max_distance >= ?", @quotation.distance, @quotation.distance)
  end

  private

    def quotation_params
      params.require(:quotation).permit(:height, :width, :length, :weight, :distance, :volume)
    end
end