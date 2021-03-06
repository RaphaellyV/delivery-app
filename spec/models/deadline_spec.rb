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
      
      it 'o prazo deve ser único para a trasportadora' do
        #Arrange
        company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                  registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                  billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        another_company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        first_deadline = Deadline.create!(min_distance: 3, max_distance: 30, max_days: 5, company: company)
        second_deadline = Deadline.new(max_days: 5, company: company)   
        third_deadline = Deadline.new(max_days: 5, company: another_company)      
  
        #Act
        second_deadline.valid?
        third_deadline.valid?

        #Assert
        expect(second_deadline.errors.include?(:max_days)).to be true
        expect(third_deadline.errors.include?(:max_days)).to be false
      end
    end

    context 'greater than' do
      it 'a distância máxima deve ser maior que a distância mínima' do
        #Arrange
        company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                  registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                  billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        deadline = Deadline.new(min_distance: 20, max_distance: 30, max_days: 4, company:company)      
  
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