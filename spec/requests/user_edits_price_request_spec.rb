require 'rails_helper'

describe 'Usuário edita um preço' do
  it 'e não é o responsável' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')

    price = Price.create!(min_vol: 0.5, max_vol: 10.0, min_weight: 0.7, max_weight: 15.0, price_per_km: 5.0, company: company)

    #Act
    login_as(another_user)
    patch(price_path(price.id), params:{price: {min_vol: 2}})

    #Assert
    expect(response).to redirect_to(root_path) 
  end
end