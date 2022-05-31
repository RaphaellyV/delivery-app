require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#valid?' do
    context 'presença' do
      it 'a placa do carro deve ser preenchida' do
        #Arrange
        vehicle = Vehicle.new(license_plate: '')
   
        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:license_plate)).to be true
      end

      it 'a marca do carro deve ser preenchida' do
        #Arrange
        vehicle = Vehicle.new(v_brand: '')
   
        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:v_brand)).to be true
      end

      it 'o modelo do carro deve ser preenchido' do
        #Arrange
        vehicle = Vehicle.new(v_model: '')
   
        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:v_model)).to be true
      end

      it 'o ano do carro deve ser preenchido' do
        #Arrange
        vehicle = Vehicle.new(v_year: '')
   
        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:v_year)).to be true
      end

      it 'a carga máxima deve ser preenchida' do
        #Arrange
        vehicle = Vehicle.new(max_load: '')
   
        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:max_load)).to be true
      end
    end

    context 'uniqueness' do
      it 'a placa do carro deve ser única' do
        #Arrange
        company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                                  registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                                  billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        first_vehicle = Vehicle.create!(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000, company: company)

        second_vehicle = Vehicle.new(license_plate: 'BEE4R22')         
  
        #Act
        second_vehicle.valid?

        #Assert
        expect(second_vehicle.errors.include?(:license_plate)).to be true
      end
    end

    context 'format' do
      it 'a placa do carro deve ter 7 dígitos' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R32')

        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:license_plate)).to be false
      end

      it 'a placa do carro não deve ter menos que 7 dígitos' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BE4R22')

        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:license_plate)).to be true
      end

      it 'a placa não deve ter mais que 7 dígitos' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R222')

        #Act
        vehicle.valid?

        #Assert
        expect(vehicle.errors.include?(:license_plate)).to be true
      end
    end
  end
end
