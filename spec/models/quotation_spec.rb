require 'rails_helper'

RSpec.describe Quotation, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'a altura deve ser preenchida' do
        #Arrange
        quotation = Quotation.new(height: '')
   
        #Act
        quotation.valid?

        #Assert
        expect(quotation.errors.include?(:height)).to be true
      end

      it 'o comprimento deve ser preenchido' do
        #Arrange
        quotation = Quotation.new(length: '')
   
        #Act
        quotation.valid?

        #Assert
        expect(quotation.errors.include?(:length)).to be true
      end

      it 'a largura deve ser preenchida' do
        #Arrange
        quotation = Quotation.new(width: '')
   
        #Act
        quotation.valid?

        #Assert
        expect(quotation.errors.include?(:width)).to be true
      end

      it 'o peso deve ser preenchido' do
        #Arrange
        quotation = Quotation.new(weight: '')
   
        #Act
        quotation.valid?

        #Assert
        expect(quotation.errors.include?(:weight)).to be true
      end

      it 'a distância deve ser preenchida' do
        #Arrange
        quotation = Quotation.new(distance: '')
   
        #Act
        quotation.valid?

        #Assert
        expect(quotation.errors.include?(:distance)).to be true
      end
    end
  end
end
