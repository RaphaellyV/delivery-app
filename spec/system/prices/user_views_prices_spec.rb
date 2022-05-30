require 'rails_helper'

describe 'Usuário vê preços' do

  it 'se estiver autenticado' do
    #Arrange

    #Act
    visit(prices_path)

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')
    Price.create!(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)
    Price.create!(min_vol: 10.01, max_vol: 14, min_weight: 15.1, max_weight:30, price_per_km: 12.50)

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
    expect(page).to have_content('10,0 a 14,0 m³')
    expect(page).to have_content('15,1 a 30,0 kg')
    expect(page).to have_content('R$ 12,50')
  end

  it 'e não existem preços cadastrados' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit prices_path
    
    #Assert
    expect(page).to have_content 'Não existem preços cadastrados.'
  end
end