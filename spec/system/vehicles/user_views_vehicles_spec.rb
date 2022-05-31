require 'rails_helper'

describe 'Usuário vê veículos de sua transportadora' do

  it 'se estiver autenticado' do
    #Arrange

    #Act
    visit(vehicles_path)

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'e não vê outros veículos' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')
    
    first_vehicle = Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000, company: company)
    second_vehicle = Vehicle.create!(license_plate: 'HMG0248', v_brand: 'Ford', v_model: 'Cargo 816', v_year:2018, max_load: 7_000, company: another_company)
    third_vehicle = Vehicle.create!(license_plate: 'HMG0365', v_brand: 'Ford', v_model: 'Cargo 816', v_year:2020, max_load: 7_000, company: company)

    #Act
    login_as(user)
    visit(vehicles_path)

    #Assert
    expect(page).not_to have_content('Não existem veículos ativos.')
    expect(page).to have_content('Placa')
    expect(page).to have_content('Marca')
    expect(page).to have_content('Modelo')
    expect(page).to have_content('Ano')
    expect(page).to have_content('Carga Máxima')

    expect(page).to have_content('BEE4R22')
    expect(page).to have_content('Mercedes-Benz')
    expect(page).to have_content('Accelo 815')
    expect(page).to have_content('2019')
    expect(page).to have_content('8000')

    expect(page).to have_content('HMG0365')
    expect(page).to have_content('2020')

    expect(page).not_to have_content('HMG0248')
    expect(page).not_to have_content('2018')
   
  end

  it 'e não existem veículos ativos' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    #Act
    login_as(user)
    visit vehicles_path
    
    #Assert
    expect(page).to have_content 'Não existem veículos ativos.'
  end
end