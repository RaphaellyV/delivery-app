require 'rails_helper'

describe 'Usuário se autentica' do
  it 'pela transportadora com sucesso' do
    #Arrange
    Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    User.create!(name: 'João Almeida', email: 'joao@olistpax.com.br', password: 'password')
    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    fill_in 'E-mail', with: 'joao@olistpax.com.br'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    
    #Assert
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_link 'Entrar como Empresa'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Olist Pax | PAX TECNOLOGIA EIRELI (“PAX”) | SP'
    expect(page).to have_content 'João Almeida - joao@olistpax.com.br'
    expect(page).to have_link 'Preços'
    expect(page).to have_link 'Prazos'
    expect(page).to have_link 'Veículos'
    expect(page).not_to have_link 'Transportadoras'
    expect(page).not_to have_link 'Criar Ordem de Serviço'
  end

  it 'como adiministrador com sucesso' do
    #Arrange
    Company.create!(brand_name: 'Sistema de Frete', corporate_name: 'Sistema de Frete LTDA', domain:'@sistemadefrete.com.br', 
                    registration_number: '30.320.042/0001-71', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    fill_in 'E-mail', with: 'joao@sistemadefrete.com.br'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    
    #Assert
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_link 'Entrar como Empresa'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'João - joao@sistemadefrete.com.br'
    expect(page).not_to have_link 'Preços'
    expect(page).not_to have_link 'Prazos'
    expect(page).not_to have_link 'Veículos'
    expect(page).to have_link 'Transportadoras'
    expect(page).to have_link 'Criar Ordem de Serviço'
  end

  it 'e faz logout' do
    #Arrange
    company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                               billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
    User.create!(name: 'João Almeida', email: 'joao@olistpax.com.br', password: 'password')

    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    fill_in 'E-mail', with: 'joao@olistpax.com.br'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    click_on 'Sair'

    #Assert
    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Entrar como Empresa'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'João Almeida - joao@olistpax.com.br'
  end
end