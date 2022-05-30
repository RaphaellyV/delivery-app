require 'rails_helper'

describe 'Admin vê detalhes da transportadora' do
  it 'a partir da tela inicial' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')
    
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    
    #Act
    login_as(user)
    visit root_path
    within ('nav') do 
      click_on 'Transportadoras'
    end
    click_on 'Olist Pax'

    #Assert
    expect(page).to have_content 'OLIST PAX'
    expect(page).to have_content 'DADOS CADASTRAIS'
    expect(page).to have_content 'CNPJ: 30.320.042/0001-70'
    expect(page).to have_content 'RAZÃO SOCIAL: PAX TECNOLOGIA EIRELI (“PAX”)'
    expect(page).to have_content 'LOCALIZAÇÃO'
    expect(page).to have_content 'ENDEREÇO: AVENIDA TAMBORÉ, 1180'
    expect(page).to have_content 'CIDADE | ESTADO: BARUERI | SP'
    expect(page).to have_content 'CEP: 06460-000'
    expect(page).to have_content 'DOMÍNIO'
    expect(page).to have_content '@olistpax.com.br'
  end

  it 'e retorna à lista de transportadoras' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    #Act
    login_as(user)
    visit(companies_path)
    click_on('Olist Pax')
    click_on('Voltar')
    #Assert
    expect(current_path).to eq(companies_path)
  end
end