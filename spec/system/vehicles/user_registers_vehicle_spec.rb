require 'rails_helper'

describe 'Usuário cadastra um veículo' do
  it 'a partir da lista de veículos' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(vehicles_path)
    click_on('Cadastrar Veículo')

    #Assert
    expect(page).to have_field('Placa')
    expect(page).to have_field('Marca')
    expect(page).to have_field('Modelo')
    expect(page).to have_field('Ano')
    expect(page).to have_field('Carga Máxima')
  end

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(vehicles_path)
    click_on('Cadastrar Veículo')
    fill_in 'Placa', with: 'BEE4R22'
    fill_in 'Marca', with: 'Mercedes-Benz'
    fill_in 'Modelo', with: 'Accelo 815'
    fill_in 'Ano', with: '2019'
    fill_in 'Carga Máxima', with: '8000'
    click_on('Enviar')

    #Assert
    expect(page).to have_content 'Veículo cadastrado com sucesso.'
    expect(page).to have_content 'BEE4R22'
    expect(page).to have_content 'Mercedes-Benz'
    expect(page).to have_content 'Accelo 815'
    expect(page).to have_content '2019'
    expect(page).to have_content '8000'
  end

  it 'com dados incompletos' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')

    #Act
    login_as(user)
    visit(vehicles_path)
    click_on('Cadastrar Veículo')
    fill_in 'Placa', with: ''
    fill_in 'Marca', with: ''
    fill_in 'Modelo', with: ''
    fill_in 'Ano', with: ''
    fill_in 'Carga Máxima', with: ''
    click_on('Enviar')
    
    #Assert
    expect(page).to have_content 'Veículo não cadastrado.'
    expect(page).to have_content 'Placa não pode ficar em branco.'
    expect(page).to have_content 'Marca não pode ficar em branco.'
    expect(page).to have_content 'Modelo não pode ficar em branco.'
    expect(page).to have_content 'Ano não pode ficar em branco.'
    expect(page).to have_content 'Carga Máxima não pode ficar em branco.' 
  end
end