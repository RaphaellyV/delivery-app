require 'rails_helper'

describe 'Admin cadastra uma transportadora' do
  it 'a partir da lista de transportadoras' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    #Act
    login_as(user)
    visit(companies_path)
    click_on('Cadastrar Transportadora')

    #Assert
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('Domínio')
  end

  it 'com sucesso' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    #Act
    login_as(user)
    visit(companies_path)
    click_on('Cadastrar Transportadora')
    fill_in 'Nome Fantasia', with: 'Olist Pax'
    fill_in 'Razão Social', with: 'PAX TECNOLOGIA EIRELI (“PAX”)'
    fill_in 'CNPJ', with: '30.320.042/0001-70'
    fill_in 'CEP', with: '06460-000'
    fill_in 'Endereço', with: 'Avenida Tamboré, 1180'
    fill_in 'Cidade', with: 'Barueri'
    fill_in 'Estado', with: 'SP'
    fill_in 'Domínio', with: '@olistpax.com.br'
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Transportadora cadastrada com sucesso.'
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

  it 'com dados incompletos' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    #Act
    login_as(user)
    visit(companies_path)
    click_on('Cadastrar Transportadora')
    fill_in 'Nome Fantasia', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'CEP', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Domínio', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Transportadora não cadastrada.'
    expect(page).to have_content 'Nome Fantasia não pode ficar em branco.'
    expect(page).to have_content 'CNPJ não pode ficar em branco.'
    expect(page).to have_content 'Razão Social não pode ficar em branco.'
    expect(page).to have_content 'Endereço não pode ficar em branco.'
    expect(page).to have_content 'Cidade não pode ficar em branco.' 
    expect(page).to have_content 'Estado não pode ficar em branco.' 
    expect(page).to have_content 'CEP não pode ficar em branco.'
    expect(page).to have_content 'Domínio não pode ficar em branco.'
  end
end