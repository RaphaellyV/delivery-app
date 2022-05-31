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

  it 'caso seja o responsável' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')

    deadline = Deadline.create!(min_distance: 1, max_distance: 50, max_days: 7, company: company)

    #Act
    login_as(another_user)
    visit edit_deadline_path(deadline.id)

    #Assert
    expect(current_path).to eq root_path
  end
end