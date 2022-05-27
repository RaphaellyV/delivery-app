class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
  before_action :set_company, only: [:show, :edit, :update]

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def create
    company_params
    @company = Company.new(company_params)

    if @company.save()
      redirect_to @company, notice:'Transportadora cadastrada com sucesso.'
    else
      flash.now[:alert]='Transportadora não cadastrada.'
      render 'new'
    end
  end

  def edit; end

  def update
    company_params
    if @company.update(company_params)
      redirect_to company_path(@company.id), notice: 'Transportadora atualizada com sucesso.'
    else
      flash.now[:notice] = 'Não foi possível atualizar a transportadora.'
      render 'edit'
    end                                      
  end

  private

    def set_company
        @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:corporate_name, :brand_name, :domain, :city, :registration_number, 
                                      :postal_code, :billing_address, :city, :state)
    end
end