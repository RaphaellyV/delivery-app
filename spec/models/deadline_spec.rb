require 'rails_helper'

RSpec.describe Deadline, type: :model do
  describe '#valid?' do
    context 'presença' do
      it 'falso quando a distância mínima não é preenchida' do
        #Arrange
        deadline = Deadline.new(min_distance: '', max_distance: 30, max_days: 5)
   
        #Act
       
        #Assert
        expect(deadline.valid?).to eq false
      end

      it 'falso quando a distância máxima não é preenchida' do
        #Arrange
        deadline = Deadline.new(min_distance: 3, max_distance: '', max_days: 5)
   
        #Act
       
        #Assert
        expect(deadline.valid?).to eq false
      end

      it 'falso quando o prazo não é preenchido' do
        #Arrange
        deadline = Deadline.new(min_distance: 3, max_distance: 30, max_days: '')
   
        #Act
       
        #Assert
        expect(deadline.valid?).to eq false
      end
    end

    context 'único' do
      
      it 'falso quando o prazo já foi cadastrado' do
        #Arrange
        first_deadline = Deadline.create(min_distance: 3, max_distance: 30, max_days: 5)

        second_deadline = Deadline.create(min_distance: 31, max_distance: 62, max_days: 5)         
  
        #Act
  
        #Assert
        expect(second_deadline.valid?).to eq false
      end
    end

    context 'menor que' do
      it 'falso quando a distância máxima é menor que a distância mínima' do
        #Arrange
        deadline = Deadline.create(min_distance: 30, max_distance: 20, max_days: 4)      
  
        #Act
  
        #Assert
        expect(deadline.valid?).to eq false
      end
    end
  end
end