require 'rails_helper'

describe 'Usuário cria uma conta para usuário de transportadora' do
  it 'como administrador' do
    #Arrange

    #Act
    visit '/users/sign_up'
    fill_in 'Nome', with: 'Maria'
    fill_in 'E-mail', with: 'maria@transportadora.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    #Assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'maria@transportadora.com'
    expect(page).to have_button 'Sair'
    user = User.last
    expect(user.name).to eq 'Maria'
  end
end
