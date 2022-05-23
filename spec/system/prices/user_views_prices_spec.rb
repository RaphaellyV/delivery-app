require 'rails_helper'

describe 'Usuário vê preços' do

  it 'com sucesso' do
    #Arrange
    Price.create!(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)
   
    Price.create!(min_vol: 10.01, max_vol: 14, min_weight: 15.01, max_weight:30, price_per_km: 12.50)

    #Act
    visit(prices_path)

    #Assert
    expect(page).not_to have_content('Não existem preços cadastrados.')
    expect(page).to have_content('Volume')
    expect(page).to have_content('Peso')
    expect(page).to have_content('Preço por km')
    expect(page).to have_content(0.5)
    expect(page).to have_content(10)
    expect(page).to have_content(0.7)
    expect(page).to have_content(15)
    expect(page).to have_content(5)
    expect(page).to have_content(10.01)
    expect(page).to have_content(14)
    expect(page).to have_content(15.01)
    expect(page).to have_content(30)
    expect(page).to have_content(12.50)
  end

  it 'e não existem preços cadastrados' do
    #Arrange

    #Act
    visit prices_path
    
    #Assert
    expect(page).to have_content 'Não existem preços cadastrados.'
  end
end