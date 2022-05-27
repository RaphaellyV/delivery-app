require 'rails_helper'

describe 'Usuário cadastra um prazo' do
  it 'a partir da lista de prazos' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(deadlines_path)
    click_on('Cadastrar Prazo')

    #Assert
    expect(page).to have_field('Distância Mínima')
    expect(page).to have_field('Distância Máxima')
    expect(page).to have_field('Prazo')
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(deadlines_path)
    click_on('Cadastrar Prazo')
    fill_in 'Distância Mínima', with: '3'
    fill_in 'Distância Máxima', with: '30'
    fill_in 'Prazo', with: '5'
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Prazo cadastrado com sucesso.'
    expect(page).to have_content '3'
    expect(page).to have_content '30'
    expect(page).to have_content '5'
  end

  it 'com dados incompletos' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(deadlines_path)
    click_on('Cadastrar Prazo')
    fill_in 'Distância Mínima', with: ''
    fill_in 'Distância Máxima', with: ''
    fill_in 'Prazo', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Prazo não cadastrado.'
    expect(page).to have_content 'Distância Mínima não pode ficar em branco.'
    expect(page).to have_content 'Distância Máxima não pode ficar em branco.'
    expect(page).to have_content 'Prazo não pode ficar em branco.'
  end
end