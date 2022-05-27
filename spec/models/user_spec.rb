require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#description' do
    it 'exibe o nome e o e-mail' do
      #Arrange
      u = User.new(name: 'Júlia Almeida', email: 'julia@yahoo.com')

      #Act
      result = u.description()

      #Assert
      expect(result).to eq('Júlia Almeida - julia@yahoo.com')
    end
  end
end
