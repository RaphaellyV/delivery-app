require 'rails_helper'

describe 'Usuário vê prazos de sua transportadora' do

  it 'se estiver autenticado' do
    #Arrange

    #Act
    visit(deadlines_path)

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    Deadline.create!(min_distance: 3, max_distance: 30, max_days: 2)
    Deadline.create!(min_distance: 31, max_distance: 70, max_days: 5)

    #Act
    login_as(user)
    visit(deadlines_path)

    #Assert
    expect(page).not_to have_content('Não existem prazos cadastrados.')
    expect(page).to have_content('Distância')
    expect(page).to have_content('Prazo')
    expect(page).to have_content(3)
    expect(page).to have_content(30)
    expect(page).to have_content(2)
    expect(page).to have_content(31)
    expect(page).to have_content(70)
    expect(page).to have_content(5)
  end

  it 'e não existem prazos cadastrados' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    
    #Act
    login_as(user)
    visit deadlines_path
    
    #Assert
    expect(page).to have_content 'Não existem prazos cadastrados.'
  end
end