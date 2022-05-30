require 'rails_helper'

describe 'Usuário se autentica' do
  it 'pela transportadora com sucesso' do
    #Arrange
    User.create!(name: 'João Almeida', email: 'joao@transportadora.com', password: 'password')
    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    fill_in 'E-mail', with: 'joao@transportadora.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    
    #Assert
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_link 'Entrar como Empresa'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'João Almeida - joao@transportadora.com'
    expect(page).to have_link 'Preços'
    expect(page).to have_link 'Prazos'
    expect(page).to have_link 'Veículos'
    expect(page).not_to have_link 'Transportadoras'
    expect(page).not_to have_link 'Criar Ordem de Serviço'
  end

  it 'como adiministrador com sucesso' do
    #Arrange
    User.create!(name: 'Joana Santos', email: 'admin@sistemadefrete.com.br', password: '12345678')
    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    fill_in 'E-mail', with: 'admin@sistemadefrete.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Entrar'
    
    #Assert
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_link 'Entrar como Empresa'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Joana Santos - admin@sistemadefrete.com.br'
    expect(page).not_to have_link 'Preços'
    expect(page).not_to have_link 'Prazos'
    expect(page).not_to have_link 'Veículos'
    expect(page).to have_link 'Transportadoras'
    expect(page).to have_link 'Criar Ordem de Serviço'
  end

  it 'e faz logout' do
    #Arrange
    User.create!(name: 'João Almeida', email: 'joao@transportadora.com', password: 'password')

    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    fill_in 'E-mail', with: 'joao@transportadora.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    click_on 'Sair'

    #Assert
    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Entrar como Empresa'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'João Almeida - joao@transportadora.com'
  end
end