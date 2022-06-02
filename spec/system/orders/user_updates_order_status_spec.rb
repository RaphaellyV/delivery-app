require 'rails_helper'

describe 'Usuário informa novo status de pedido' do
  it 'e pedido foi aceito' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    order = Order.create!(company: company, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP', status: :pending) 

    #Act
    login_as(user)
    visit order_path(order.id)
    click_on 'Aceitar Ordem de Serviço'

    #Assert
    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content('Status: Aceita')
    expect(page).to have_button('Pedido Entregue')
    expect(page).not_to have_button('Aceitar Ordem de Serviço')
    expect(page).not_to have_button('Recusar Ordem de Serviço')
  end

  it 'e pedido foi recusado' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    order = Order.create!(company: company, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP', status: :pending) 

    #Act
    login_as(user)
    visit order_path(order.id)
    click_on 'Recusar Ordem de Serviço'

    #Assert
    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content('Status: Recusada')
    expect(page).not_to have_button('Aceitar Ordem de Serviço')
    expect(page).not_to have_button('Pedido Entregue')
  end

  it 'e pedido foi entregue' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@olistpax.com.br', password: 'password')

    order = Order.create!(company: company, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP', status: :accepted) 

    #Act
    login_as(user)
    visit order_path(order.id)
    click_on 'Pedido Entregue'

    #Assert
    expect(current_path).to eq order_path(order.id)
    expect(page).to have_content('Status: Entregue')
    expect(page).not_to have_button('Aceitar Ordem de Serviço')
    expect(page).not_to have_button('Recusar Ordem de Serviço')
    expect(page).not_to have_button('Pedido Entregue')
  end
end