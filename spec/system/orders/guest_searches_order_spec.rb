require 'rails_helper'

describe 'Visitante busca por um pedido' do
  it 'a partir da tela inicial' do
    #Arrange
    
    #Act
    visit root_path

    #Assert
    expect(page).to have_field('Buscar Pedido')
    expect(page).to have_button('Buscar')
  end

  it 'e encontra um pedido' do
    #Arrange
    
    company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                              registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                              billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

    order = Order.create!(company: company, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP') 

    #Act
    visit root_path
    fill_in 'Buscar Pedido', with: order.tracking_code
    click_on 'Buscar'

    #Assert
    expect(page).to have_content "Resultado da Busca por: #{order.tracking_code}"
    expect(page).to have_content "Código de Rastreamento: #{order.tracking_code}"
    expect(page).to have_content 'Destinatário: Helena Silva'
    expect(page).to have_content 'Código do Produto: TV40-SAMS-XPTO'
    expect(page).not_to have_content "Não foi possível encontrar o pedido."
  end

  it 'e o pedido não é encontrado' do
    #Arrange

    #Act
    visit root_path
    fill_in 'Buscar Pedido', with: 'ABCDEFG12345678'
    click_on 'Buscar'

    #Assert
    expect(page).to have_content 'Não foi possível encontrar o pedido.'
  end
end