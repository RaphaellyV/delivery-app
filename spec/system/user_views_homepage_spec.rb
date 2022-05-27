require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome da app' do
    #Arrange

    #Act
    visit(root_path)

    #Assert
    expect(page).to have_content('Sistema de Entregas')
    expect(page).to have_link('Sistema de Entregas', href: root_path)
  end
end