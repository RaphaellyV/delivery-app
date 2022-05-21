require 'rails_helper'

describe 'Admin vê transportadoras' do

  it 'com sucesso' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
    Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                    registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                    billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

    #Act
    visit(companies_path)

    #Assert
    expect(page).not_to have_content('Não existem transportadoras ativas.')
    expect(page).to have_content('Transportadoras Ativas')
    expect(page).to have_content('Olist Pax - SP')
    expect(page).to have_content('ASAP Log - PR')
  end

  it 'e não existem transportadoras ativas' do
    #Arrange

    #Act
    visit companies_path
    
    #Assert
    expect(page).to have_content 'Não existem transportadoras ativas.'
  end
end