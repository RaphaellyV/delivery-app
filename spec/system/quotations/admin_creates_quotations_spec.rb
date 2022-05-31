require 'rails_helper'

describe 'Admin cria um orçamento' do

  it 'se estiver autenticado' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    #Act
    login_as(user)
    visit new_quotation_path

    #Assert
    expect(current_path).to eq root_path
  end

  it 'a partir da tela inicial' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    #Act
    login_as(user)
    visit root_path

    #Assert
    expect(page).to have_link 'Criar Orçamento'
  end
end