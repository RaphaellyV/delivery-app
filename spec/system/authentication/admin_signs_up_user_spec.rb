require 'rails_helper'

describe 'Usuário cria uma conta' do
  it 'como usuário de transportadora' do
    #Arrange

    #Act
    visit root_path
    click_on 'Entrar como Empresa'
    click_on 'Criar uma conta'
    fill_in 'Nome', with: 'Maria'
    fill_in 'E-mail', with: 'maria@transportadora.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    #Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'Maria - maria@transportadora.com'
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
