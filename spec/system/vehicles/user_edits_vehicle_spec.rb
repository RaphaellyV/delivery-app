require 'rails_helper'

describe 'Usuário edita um veículo' do
  it 'a partir da lista de veículos' do
    #Arrange
    vehicle = Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)

    #Act
    visit vehicles_path
    click_on('BEE4R22')

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
    vehicle = Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)

    #Act
    visit(vehicles_path)
    click_on('BEE4R22')
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
    vehicle = Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)

    #Act
    visit(vehicles_path)
    click_on('BEE4R22')
    fill_in 'Placa', with: ''
    fill_in 'Marca', with: ''
    fill_in 'Modelo', with: ''
    fill_in 'Ano', with: ''
    fill_in 'Carga Máxima', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Não foi possível atualizar o veículo.'
  end
end