require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'o nome é obrigatório' do
      #Arrange
      user = User.new(name: '')

      #Act
      user.valid?

      #Assert
      expect(user.errors.include?(:name)).to be true
    end
  end

  describe '#description' do
    it 'exibe o nome e o e-mail' do
      #Arrange
      user = User.new(name: 'Júlia Almeida', email: 'julia@yahoo.com')

      #Act

      #Assert
      expect(user.description).to eq('Júlia Almeida - julia@yahoo.com')
    end
  end
end
