require 'rails_helper'

describe 'Usuário vê prazos de sua transportadora' do

  it 'se estiver autenticado' do
    #Arrange

    #Act
    visit(deadlines_path)

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'e não vê outros prazos' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                      registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                      billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    another_user = User.create!(name: 'Maria', email: 'maria@asaplog.com.br', password: 'password')
    
    first_deadline = Deadline.create!(min_distance: 3, max_distance: 30, max_days: 2, company: company)
    second_deadline = Deadline.create!(min_distance: 31, max_distance: 70, max_days: 5, company: another_company)
    third_deadline = Deadline.create!(min_distance: 80, max_distance: 100, max_days: 10, company: company)

    #Act
    login_as(user)
    visit root_path
    click_on 'Prazos'

    #Assert
    expect(page).not_to have_content('Não existem prazos cadastrados.')
    expect(page).to have_content('Distância')
    expect(page).to have_content('Prazo')
    expect(page).to have_content first_deadline.min_distance
    expect(page).to have_content first_deadline.max_distance
    expect(page).to have_content first_deadline.max_days
    expect(page).to have_content third_deadline.min_distance
    expect(page).to have_content third_deadline.max_distance
    expect(page).to have_content third_deadline.max_days
    expect(page).not_to have_content second_deadline.min_distance
    expect(page).not_to have_content second_deadline.max_distance
    expect(page).not_to have_content second_deadline.max_days
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