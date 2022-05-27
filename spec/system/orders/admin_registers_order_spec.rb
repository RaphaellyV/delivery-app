require 'rails_helper'

describe 'Administrador cadastra uma ordem de serviço' do
  it 'e deve estar autenticado' do
    #Arrange
    
    #Act
    visit new_order_path

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@email.com', password: 'password', admin: true)

    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
    company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                    registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                    billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

    #Act
    login_as(user)
    visit root_path
    click_on 'Criar Ordem de Serviço'

    fill_in 'Destinatário', with: 'Helena Silva'
    fill_in 'CPF', with: '198.163.877-14'
    fill_in 'Telefone', with: '22985202240'
    fill_in 'E-mail', with: 'helena@gmail.com'
    fill_in 'Endereço de Destino', with: 'Rua Caetés, 360'
    fill_in 'CEP de Destino', with: '24715-520'
    fill_in 'Cidade de Destino', with: 'Maricá' 
    fill_in 'Estado de Destino', with: 'RJ' 
    
    fill_in 'Código do Produto', with: 'TV40-SAMS-XPTO'
    fill_in 'Comprimento do Produto', with: '90'
    fill_in 'Largura do Produto', with: '10'
    fill_in 'Altura do Produto', with: '60'
    fill_in 'Peso do Produto', with: '10000'
    fill_in 'Endereço de Coleta', with: 'Rua das Bandeiras, 450'
    fill_in 'Cidade de Coleta', with: 'São Paulo'
    fill_in 'CEP de Coleta', with: '53300-000'
    fill_in 'Estado de Coleta', with: 'SP' 

    select 'ASAP Log | Asap Log Ltda | PR', from: 'Transportadora Responsável'
    click_on 'Gerar Ordem de Serviço'

    #Assert
    expect(page).to have_content 'Ordem de serviço registrada com sucesso'
    expect(page).to have_content 'Destinatário: Helena Silva'
    expect(page).to have_content 'CPF: 198.163.877-14'
    expect(page).to have_content 'Telefone: 22985202240'
    expect(page).to have_content 'E-mail: helena@gmail.com'
    expect(page).to have_content 'Endereço de Destino: Rua Caetés, 360 - Maricá - RJ'
    expect(page).to have_content 'CEP de Destino: 24715-520'
    
    expect(page).to have_content 'Código do Produto: TV40-SAMS-XPTO'
    expect(page).to have_content 'Dimensões do Produto: 90 cm x 10 cm x 60 cm'
    expect(page).to have_content 'Endereço de Coleta: Rua das Bandeiras, 450 - São Paulo - SP'
    expect(page).to have_content 'CEP de Coleta: 53300-000'
  
    expect(page).to have_content 'Transportadora Responsável: ASAP Log | Asap Log Ltda | PR'
    expect(page).not_to have_content 'Olist Pax'
  end

  it 'com dados incompletos' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@email.com', password: 'password', admin: true)
    company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                              registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                              billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

    #Act
    login_as(user)
    visit root_path
    click_on 'Criar Ordem de Serviço'

    fill_in 'Destinatário', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Telefone', with: ''

    select 'ASAP Log | Asap Log Ltda | PR', from: 'Transportadora Responsável'
    click_on 'Gerar Ordem de Serviço'
    
    #Assert
    expect(page).to have_content 'Não foi possível gerar a ordem de serviço.'
    expect(page).to have_content 'Destinatário não pode ficar em branco.'
    expect(page).to have_content 'CPF não pode ficar em branco.'
    expect(page).to have_content 'Telefone não pode ficar em branco.'
  end
end