require 'rails_helper'

describe 'Usuário edita um prazo' do
  it 'a partir da lista de prazos' do
    #Arrange
    deadline = Deadline.create!(min_distance: 1, max_distance: 50, max_days: 7)

    #Act
    visit deadlines_path
    click_on('Editar')

    #Assert
    expect(page).to have_content 'Editar Prazo'
    expect(page).to have_field('Distância Mínima', with: 1)
    expect(page).to have_field('Distância Máxima', with: 50)
    expect(page).to have_field('Prazo', with: 7)
  end
end