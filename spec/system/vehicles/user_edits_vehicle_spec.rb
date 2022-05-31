require 'rails_helper'

describe 'Usuário edita um veículo' do
  it 'a partir da lista de veículos' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000, 
                    company: company)

    #Act
    login_as(user)
    visit vehicles_path
    click_on('Editar')

    #Assert
    expect(page).to have_content 'Editar Veículo'
    expect(page).to have_field('Placa', with: 'BEE4R22')
    expect(page).to have_field('Marca', with: 'Mercedes-Benz')
    expect(page).to have_field('Modelo', with: 'Accelo 815')
    expect(page).to have_field('Ano', with: '2019')
    expect(page).to have_field('Carga Máxima', with: '8000')
  end

  it 'com sucesso' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000, 
                    company: company)

    #Act
    login_as(user)
    visit(vehicles_path)
    click_on('Editar')
    fill_in 'Placa', with: 'BEE4R23'
    fill_in 'Marca', with: 'Fiat'
    fill_in 'Modelo', with: 'Accelo 817'
    click_on('Enviar')

    #Assert
    expect(current_path).to eq(vehicles_path)
    expect(page).to have_content 'Veículo atualizado com sucesso.'
    expect(page).to have_content 'BEE4R23'
    expect(page).to have_content 'Fiat'
    expect(page).to have_content 'Accelo 817'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000, 
                    company: company)

    #Act
    login_as(user)
    visit(vehicles_path)
    click_on('Editar')
    fill_in 'Placa', with: ''
    fill_in 'Marca', with: ''
    fill_in 'Modelo', with: ''
    fill_in 'Ano', with: ''
    fill_in 'Carga Máxima', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Não foi possível atualizar o veículo.'
  end

  it 'caso seja o responsável' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')

    vehicle = Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000, 
                              company: company)

    #Act
    login_as(another_user)
    visit edit_vehicle_path(vehicle.id)

    #Assert
    expect(current_path).to eq root_path
  end
end