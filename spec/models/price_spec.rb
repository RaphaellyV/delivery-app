require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid?' do
    context 'presença' do
      it 'falso quando o volume mínimo não é preenchido' do
        #Arrange
        price = Price.new(min_vol: '', max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)
   
        #Act
       
        #Assert
        expect(price.valid?).to eq false
      end

      it 'falso quando o volume máximo não é preenchido' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: '', min_weight: 0.7, max_weight: 15, price_per_km: 5)
   
        #Act
       
        #Assert
        expect(price.valid?).to eq false
      end

      it 'falso quando o peso mínimo não é preenchido' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: 10, min_weight: '', max_weight: 15, price_per_km: 5)
   
        #Act
       
        #Assert
        expect(price.valid?).to eq false
      end

      it 'falso quando o peso máximo não é preenchido' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: '', price_per_km: 5)
   
        #Act
       
        #Assert
        expect(price.valid?).to eq false
      end

      it 'falso quando o preço por km não é preenchido' do
        #Arrange
        price = Price.new(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight:15, price_per_km: '')
   
        #Act
       
        #Assert
        expect(price.valid?).to eq false
      end
    end

    context 'único' do
      it 'falso quando o preço já foi cadastrado' do
        #Arrange
        first_price = Price.create(min_vol: 0.5, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)

        second_price = Price.create(min_vol: 10.01, max_vol: 14, min_weight: 15.01, max_weight:30, price_per_km: 5)         
  
        #Act
  
        #Assert
        expect(second_price.valid?).to eq false
      end
    end

    context 'menor que' do
      it 'falso quando o volume máximo é menor que o volume mínimo' do
        #Arrange
        price = Price.create(min_vol: 11, max_vol: 10, min_weight: 0.7, max_weight: 15, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq false
      end

      it 'falso quando o peso máximo é menor que o peso mínimo' do
        #Arrange
        price = Price.create(min_vol: 0.5, max_vol: 10, min_weight: 16, max_weight: 15, price_per_km: 5)      
  
        #Act
  
        #Assert
        expect(price.valid?).to eq false
      end
    end
  end
end
