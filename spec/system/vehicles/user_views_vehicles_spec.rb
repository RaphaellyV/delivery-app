require 'rails_helper'

describe 'Usuário vê veículos' do

  it 'com sucesso' do
    #Arrange
    Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)
   
    Vehicle.create!(license_plate: 'HMG0248', v_brand: 'Ford', v_model: 'Cargo 816', v_year:2018, max_load: 7_000)

    #Act
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
    expect(page).to have_content('HMG0248')
    expect(page).to have_content('Ford')
    expect(page).to have_content('Cargo 816')
    expect(page).to have_content('2018')
    expect(page).to have_content('7000')
  end

  it 'e não existem veículos ativos' do
    #Arrange

    #Act
    visit vehicles_path
    
    #Assert
    expect(page).to have_content 'Não existem veículos ativos.'
  end
end