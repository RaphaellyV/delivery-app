require 'rails_helper'

describe 'Usuário edita uma transportadora' do
  it 'a partir da página de detalhes' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    #Act
    visit companies_path
    click_on 'Olist Pax'
    click_on 'Editar'

    #Assert
    expect(page).to have_content 'Editar Transportadora'
    expect(page).to have_field('Nome Fantasia', with: 'Olist Pax')
    expect(page).to have_field('Razão Social', with: 'PAX TECNOLOGIA EIRELI (“PAX”)')
    expect(page).to have_field('CNPJ', with: '30.320.042/0001-70')
    expect(page).to have_field('CEP', with: '06460-000')
    expect(page).to have_field('Endereço', with: 'Avenida Tamboré, 1180')
    expect(page).to have_field('Cidade', with: 'Barueri')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('Domínio', with: '@olistpax.com.br')
  end

  it 'com sucesso' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')

    #Act
    visit(companies_path)
    click_on('Olist Pax')
    click_on('Editar')
    fill_in 'Nome Fantasia', with: 'Olist'
    fill_in 'CNPJ', with: '30.320.042/0001-73'
    fill_in 'CEP', with: '06360-000'
    fill_in 'Endereço', with: 'Avenida Ibirapuera, 1180'
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Transportadora atualizada com sucesso.'
    expect(page).to have_content 'OLIST'
    expect(page).to have_content 'CNPJ: 30.320.042/0001-73'
    expect(page).to have_content 'CEP: 06360-000'
    expect(page).to have_content 'ENDEREÇO: AVENIDA IBIRAPUERA, 1180'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    #Act
    visit companies_path
    click_on 'Olist Pax'
    click_on 'Editar'
    fill_in 'Nome Fantasia', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'CEP', with: ''
    fill_in 'Endereço', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Não foi possível atualizar a transportadora.'
  end
end