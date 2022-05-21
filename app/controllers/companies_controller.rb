class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    company_params = params.require(:company).permit(:corporate_name, :brand_name, :domain, :city, :registration_number, 
                                     :postal_code, :billing_address, :city, :state)
    @company=Company.new(company_params)

    if @company.save()
      redirect_to @company, notice:'Transportadora cadastrada com sucesso.'
    else
      flash.now[:notice]='Transportadora não cadastrada.'
      render 'new'
    end
  end
end