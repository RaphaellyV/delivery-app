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
    click_on('Criar Orçamento')

    #Assert
    expect(page).to have_field('Altura')
    expect(page).to have_field('Largura')
    expect(page).to have_field('Comprimento')
    expect(page).to have_field('Peso')
    expect(page).to have_field('Distância')
  end

  it 'com sucesso' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    admin = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')
    
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')


    first_price = Price.create!(min_vol: 0, max_vol: 10, min_weight: 0, max_weight: 15, price_per_km: 5, company: company)
    second_price = Price.create!(min_vol: 0, max_vol: 14, min_weight: 0, max_weight:30, price_per_km: 12.50, company: another_company)
    third_price = Price.create!(min_vol: 0, max_vol: 10, min_weight: 31, max_weight:60, price_per_km: 50, company: company)
   
    first_deadline = Deadline.create!(min_distance: 3, max_distance: 150, max_days: 2, company: company)
    second_deadline = Deadline.create!(min_distance: 31, max_distance: 200, max_days: 5, company: another_company)
    third_deadline = Deadline.create!(min_distance: 151, max_distance: 300, max_days: 20, company: company)
    
    #Act
    login_as(admin)
    visit root_path
    click_on('Criar Orçamento')
    fill_in 'Altura', with: '60'
    fill_in 'Largura', with: '10'
    fill_in 'Comprimento', with: '90'
    fill_in 'Peso', with: '500'
    fill_in 'Distância', with: '100'
    click_on('Enviar')

    #Assert
    expect(page).to have_content('Dimensões: 90 cm x 10 cm x 60 cm')
    expect(page).to have_content('Peso: 500 g')
    expect(page).to have_content('Distância: 100 km')
    expect(page).to have_content('Empresa')
    expect(page).to have_content company.brand_name
    expect(page).to have_content another_company.brand_name
    expect(page).to have_content('Valor Total')
    expect(page).to have_content('R$ 500,00')
    expect(page).to have_content('R$ 1.250,00')
    expect(page).not_to have_content('R$ 5.000,00')
    expect(page).to have_content('Prazo de Entrega')
    expect(page).to have_content first_deadline.max_days
    expect(page).to have_content second_deadline.max_days
    expect(page).not_to have_content third_deadline.max_days
  end

  it 'com dados incompletos' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    admin = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')


    first_price = Price.create!(min_vol: 0, max_vol: 10, min_weight: 0, max_weight: 15, price_per_km: 5, company: company)
    second_price = Price.create!(min_vol: 0, max_vol: 14, min_weight: 0, max_weight:30, price_per_km: 12.50, company: another_company)

    first_deadline = Deadline.create!(min_distance: 3, max_distance: 150, max_days: 2, company: company)
    second_deadline = Deadline.create!(min_distance: 31, max_distance: 200, max_days: 5, company: another_company)

    #Act
    login_as(admin)
    visit root_path
    click_on('Criar Orçamento')
    fill_in 'Altura', with: ''
    fill_in 'Largura', with: ''
    fill_in 'Comprimento', with: ''
    fill_in 'Peso', with: ''
    fill_in 'Distância', with: ''
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Não foi possível gerar o orçamento.'
    expect(page).to have_content 'Altura não pode ficar em branco.'
    expect(page).to have_content 'Largura não pode ficar em branco.'
    expect(page).to have_content 'Comprimento não pode ficar em branco.'
    expect(page).to have_content 'Peso não pode ficar em branco.'
    expect(page).to have_content 'Distância não pode ficar em branco.'
  end
end