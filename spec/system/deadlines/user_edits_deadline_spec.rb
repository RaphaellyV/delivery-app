require 'rails_helper'

describe 'Usuário edita um prazo' do
  it 'a partir da lista de prazos' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    deadline = Deadline.create!(min_distance: 1, max_distance: 50, max_days: 7, company: company)

    #Act
    login_as(user)
    visit deadlines_path
    click_on('Editar')

    #Assert
    expect(page).to have_content 'Editar Prazo'
    expect(page).to have_field('Distância Mínima', with: 1)
    expect(page).to have_field('Distância Máxima', with: 50)
    expect(page).to have_field('Prazo', with: 7)
  end

  it 'com sucesso' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    deadline = Deadline.create!(min_distance: 1, max_distance: 50, max_days: 7, company: company)

    #Act
    login_as(user)
    visit deadlines_path
    click_on('Editar')
    fill_in 'Distância Mínima', with: 2
    fill_in 'Prazo', with: 8
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Prazo atualizado com sucesso.'
    expect(page).to have_content '2 a 50 km'
    expect(page).to have_content '8 dias úteis'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')
    deadline = Deadline.create!(min_distance: 1, max_distance: 50, max_days: 7, company: company)

    #Act
    login_as(user)
    visit deadlines_path
    click_on('Editar')
    fill_in 'Distância Mínima', with: ''
    fill_in 'Prazo', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Não foi possível atualizar o prazo.'
  end
end