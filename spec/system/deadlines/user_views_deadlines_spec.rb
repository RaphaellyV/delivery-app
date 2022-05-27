require 'rails_helper'

describe 'Usuário vê prazos' do

  it 'com sucesso' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')
    Deadline.create!(min_distance: 3, max_distance: 30, max_days: 2)
    Deadline.create!(min_distance: 31, max_distance: 70, max_days: 5)

    #Act
    login_as(user)
    visit(deadlines_path)

    #Assert
    expect(page).not_to have_content('Não existem prazos cadastrados.')
    expect(page).to have_content('Distância')
    expect(page).to have_content('Prazo')
    expect(page).to have_content(3)
    expect(page).to have_content(30)
    expect(page).to have_content(2)
    expect(page).to have_content(31)
    expect(page).to have_content(70)
    expect(page).to have_content(5)
  end

  it 'e não existem prazos cadastrados' do
    #Arrange
    user = User.create!(name: 'João', email: 'joao@transportadora.com', password: 'password')
    
    #Act
    login_as(user)
    visit deadlines_path
    
    #Assert
    expect(page).to have_content 'Não existem prazos cadastrados.'
  end
end