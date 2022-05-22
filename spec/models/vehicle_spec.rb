require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#valid?' do
    context 'presença' do
      it 'falso quando a placa não é preenchida' do
        #Arrange
        vehicle = Vehicle.new(license_plate: '', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)
   
        #Act
       
        #Assert
        expect(vehicle.valid?).to eq false
      end

      it 'falso quando a marca não é preenchida' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R22', v_brand: '', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)
   
        #Act
       
        #Assert
        expect(vehicle.valid?).to eq false
      end

      it 'falso quando o modelo não é preenchido' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: '', v_year:2019, max_load: 8_000)
   
        #Act
       
        #Assert
        expect(vehicle.valid?).to eq false
      end

      it 'falso quando o ano não é preenchido' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year: '', max_load: 8_000)
   
        #Act
       
        #Assert
        expect(vehicle.valid?).to eq false
      end

      it 'falso quando a carga máxima não é preenchida' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year: 2019, max_load: '')
   
        #Act
       
        #Assert
        expect(vehicle.valid?).to eq false
      end
    end

    context 'único' do
      it 'falso quando a placa já está em uso' do
        #Arrange
        first_vehicle = Vehicle.create(license_plate: 'BEE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)

        second_vehicle = Vehicle.create(license_plate: 'BEE4R22', v_brand: 'Ford', v_model: 'Cargo 816', v_year:2018, max_load: 7_000)         
  
        #Act
  
        #Assert
        expect(second_vehicle.valid?).to eq false
      end
    end

    context 'formato' do
      it 'falso quando a placa tem menos dígitos que o esperado' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BE4R22', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)

        #Act
          
        #Assert
        expect(vehicle.valid?).to eq false
      end

      it 'falso quando a placa tem mais dígitos que o esperado' do
        #Arrange
        vehicle = Vehicle.new(license_plate: 'BEE4R222', v_brand: 'Mercedes-Benz', v_model: 'Accelo 815', v_year:2019, max_load: 8_000)

        #Act
          
        #Assert
        expect(vehicle.valid?).to eq false
      end
    end
  end
end
