require 'rails_helper'

describe 'Usuário cria uma conta' do
  it 'como usuário de transportadora' do
    #Arrange
    first_company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    second_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                     registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                     billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Maria'
    fill_in 'E-mail', with: 'maria@olistpax.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    #Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'Maria - maria@olistpax.com.br'
    expect(page).to have_button 'Sair'
    expect(page).to have_link 'Preços'
  end

  it 'como administrador' do
    #Arrange

    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Sandra Souza'
    fill_in 'E-mail', with: 'sandra@sistemadefrete.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    #Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'Sandra Souza - sandra@sistemadefrete.com.br'
    expect(page).to have_button 'Sair'
    expect(page).to have_link 'Transportadoras'
  end
end
