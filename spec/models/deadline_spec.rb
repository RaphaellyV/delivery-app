require 'rails_helper'

RSpec.describe Deadline, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'a distância mínima deve ser obrigatória' do
        #Arrange
        deadline = Deadline.new(min_distance: '')
   
        #Act
        deadline.valid?

        #Assert
        expect(deadline.errors.include?(:min_distance)).to be true
      end

      it 'a distância máxima deve ser obrigatória' do
        #Arrange
        deadline = Deadline.new(max_distance: '')
   
        #Act
        deadline.valid?

        #Assert
        expect(deadline.errors.include?(:max_distance)).to be true
      end

      it 'o prazo deve ser obrigatório' do
        #Arrange
        deadline = Deadline.new(max_days: '')
   
        #Act
        deadline.valid?

        #Assert
        expect(deadline.errors.include?(:max_days)).to be true
      end
    end

    context 'uniqueness' do
      
      it 'o prazo deve ser único' do
        #Arrange
        first_deadline = Deadline.create!(min_distance: 3, max_distance: 30, max_days: 5)

        second_deadline = Deadline.new(max_days: 5)         
  
        #Act
        second_deadline.valid?

        #Assert
        expect(second_deadline.errors.include?(:max_days)).to be true
      end
    end

    context 'greater than' do
      it 'a distância máxima deve ser maior que a distância mínima' do
        #Arrange
        deadline = Deadline.new(min_distance: 20, max_distance: 30, max_days: 4)      
  
        #Act
  
        #Assert
        expect(deadline.valid?).to eq true
      end

      it 'a distância máxima não deve ser igual à distância mínima' do
        #Arrange
        deadline = Deadline.new(min_distance: 20, max_distance: 20, max_days: 4)      
  
        #Act
  
        #Assert
        expect(deadline.valid?).to eq false
      end

      it 'a distância máxima não deve ser menor que a distância mínima' do
        #Arrange
        deadline = Deadline.new(min_distance: 30, max_distance: 20, max_days: 4)      
  
        #Act
  
        #Assert
        expect(deadline.valid?).to eq false
      end
    end
  end
end