require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'o volume mínimo deve ser preenchido' do
        #Arrange
        price = Price.new(min_vol: '')
   
        #Act
        price.valid?

        #Assert
        expect(price.errors.include?(:min_vol)).to be true
      end

      it 'o volume máximo deve ser preenchido' do
        #Arrange
        price = Price.new(max_vol: '')
   
        #Act
        price.valid?

        #Assert
        expect(price.errors.include?(:max_vol)).to be true
      end

      it 'o peso mínimo deve ser preenchido' do
        #Arrange
        price = Price.new(min_weight: '')
   
        #Act
        price.valid?

        #Assert
        expect(price.errors.include?(:min_weight)).to be true
      end

      it 'o peso máximo deve ser preenchido' do
        #Arrange
        price = Price.new(max_weight: '')
   
        #Act
        price.valid?

        #Assert
        expect(price.errors.include?(:max_weight)).to be true
      end

      it 'o preço por km deve ser preenchido' do
        #Arrange
        price = Price.new(price_per_km: '')
   
        #Act
        price.valid?

        #Assert
        expect(price.errors.include?(:price_per_km)).to be true
      end
    end

    context 'uniqueness' do
      it 'o preço deve ser único' do
        #Arrange
        first_price = Price.create!(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)

        second_price = Price.new(price_per_km: 5)         
  
        #Act
        second_price.valid?

        #Assert
        expect(second_price.errors.include?(:price_per_km)).to be true
      end
    end

    context 'greater than' do
      it 'o volume máximo deve ser maior que o volume mínimo' do
        #Arrange
        price = Price.new(min_vol: 10, max_vol: 13, min_weight: 0.7, max_weight: 15, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq true
      end

      it 'o volume máximo não deve ser menor que o volume mínimo' do
        #Arrange
        price = Price.new(min_vol: 11, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq false
      end

      it 'o volume máximo não deve ser igual ao volume mínimo' do
        #Arrange
        price = Price.new(min_vol: 10, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq false
      end

      it 'o peso máximo deve ser maior que o peso mínimo' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: 16, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq true
      end

      it 'o peso máximo não deve ser menor que o peso mínimo' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: 10, min_weight: 16, max_weight: 15, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq false
      end

      it 'o peso máximo não deve ser igual ao peso mínimo' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: 10, min_weight: 16, max_weight: 16, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq false
      end
    end
  end
end
