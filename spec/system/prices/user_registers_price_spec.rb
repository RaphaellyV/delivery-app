require 'rails_helper'

describe 'Usuário cadastra um preço' do
  it 'a partir da lista de preços' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(prices_path)
    click_on('Cadastrar Preço')

    #Assert
    expect(page).to have_field('Volume Mínimo')
    expect(page).to have_field('Volume Máximo')
    expect(page).to have_field('Peso Mínimo')
    expect(page).to have_field('Peso Máximo')
    expect(page).to have_field('Preço por km')
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(prices_path)
    click_on('Cadastrar Preço')
    fill_in 'Volume Mínimo', with: '1'
    fill_in 'Volume Máximo', with: '10'
    fill_in 'Peso Mínimo', with: '2'
    fill_in 'Peso Máximo', with: '15'
    fill_in 'Preço por km', with: '5'
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Preço cadastrado com sucesso.'
    expect(page).to have_content '1'
    expect(page).to have_content '10'
    expect(page).to have_content '2'
    expect(page).to have_content '15'
    expect(page).to have_content '5'
  end

  it 'com dados incompletos' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(prices_path)
    click_on('Cadastrar Preço')
    fill_in 'Volume Mínimo', with: ''
    fill_in 'Volume Máximo', with: ''
    fill_in 'Peso Mínimo', with: ''
    fill_in 'Peso Máximo', with: ''
    fill_in 'Preço por km', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Preço não cadastrado.'
    expect(page).to have_content 'Volume Mínimo não pode ficar em branco.'
    expect(page).to have_content 'Volume Máximo não pode ficar em branco.'
    expect(page).to have_content 'Peso Mínimo não pode ficar em branco.'
    expect(page).to have_content 'Peso Máximo não pode ficar em branco.'
    expect(page).to have_content 'Preço por km não pode ficar em branco.' 
  end
end