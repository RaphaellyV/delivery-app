require 'rails_helper'

describe 'Usuário vê preços de sua transportadora' do

  it 'se estiver autenticado' do
    #Arrange

    #Act
    visit(prices_path)

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'e não vê outros preços' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')


    first_price = Price.create!(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5, company: company)
    second_price = Price.create!(min_vol: 11, max_vol: 14, min_weight: 15.1, max_weight:30, price_per_km: 12.50, company: another_company)
    third_price = Price.create!(min_vol: 15, max_vol: 25, min_weight: 31, max_weight:60, price_per_km: 50, company: company)

    #Act
    login_as(user)
    visit(prices_path)

    #Assert
    expect(page).not_to have_content('Não existem preços cadastrados.')
    expect(page).to have_content('Volume')
    expect(page).to have_content('Peso')
    expect(page).to have_content('Preço por km')
    expect(page).to have_content('0,500 a 10,0 m³')
    expect(page).to have_content('0,7 a 15,0 kg')
    expect(page).to have_content('R$ 5,00')

    expect(page).to have_content('15,0 a 25,0 m³')
    expect(page).to have_content('31,0 a 60,0 kg')
    expect(page).to have_content('R$ 50,00')

    expect(page).not_to have_content('11,0 a 14,0 m³')
    expect(page).not_to have_content('15,1 a 30,0 kg')
    expect(page).not_to have_content('R$ 12,50')
  end

  it 'e não existem preços cadastrados' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    #Act
    login_as(user)
    visit prices_path
    
    #Assert
    expect(page).to have_content 'Não existem preços cadastrados.'
  end
end