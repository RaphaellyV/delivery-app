require 'rails_helper'

describe 'Admin cadastra uma transportadora' do
  it 'a partir da lista de transportadoras' do
    #Arrange

    #Act
    visit(companies_path)
    click_on('Cadastrar Transportadora')

    #Assert
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('Domínio')
  end
end