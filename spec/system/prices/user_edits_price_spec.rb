require 'rails_helper'

describe 'Usuário edita um preço' do
  it 'a partir da lista de preços' do
    #Arrange
    price = Price.create!(min_vol: 0.5, max_vol: 10.0, min_weight: 0.7, max_weight: 15.0, price_per_km: 5.0)

    #Act
    visit prices_path
    click_on('Editar')

    #Assert
    expect(page).to have_content 'Editar Preço'
    expect(page).to have_field('Volume Mínimo', with: 0.5)
    expect(page).to have_field('Volume Máximo', with: 10.0)
    expect(page).to have_field('Peso Mínimo', with: 0.7)
    expect(page).to have_field('Peso Máximo', with: 15.0)
    expect(page).to have_field('Preço por km', with: 5.0)
  end

  it 'com sucesso' do
    #Arrange
    price = Price.create!(min_vol: 0.5, max_vol: 10.0, min_weight: 0.7, max_weight: 15.0, price_per_km: 5.0)

    #Act
    visit(prices_path)
    click_on('Editar')
    fill_in 'Volume Máximo', with: 15.0
    fill_in 'Peso Máximo', with: 20.0
    fill_in 'Preço por km', with: 10.0
    click_on('Enviar')

    #Assert
    expect(current_path).to eq(prices_path)
    expect(page).to have_content 'Preço atualizado com sucesso.'
    expect(page).to have_content 15.0
    expect(page).to have_content 20.0
    expect(page).to have_content 10.0
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    price = Price.create!(min_vol: 0.5, max_vol: 10.0, min_weight: 0.7, max_weight: 15.0, price_per_km: 5.0)

    #Act
    visit(prices_path)
    click_on('Editar')
    fill_in 'Volume Mínimo', with: ''
    fill_in 'Volume Máximo', with: ''
    fill_in 'Peso Mínimo', with: ''
    fill_in 'Peso Máximo', with: ''
    fill_in 'Preço por km', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Não foi possível atualizar o preço.'
  end
end