require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it 'deve ter um código de rastreamento' do
      #Arrange
      Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
      
      order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                        recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                        recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                        recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                        product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                        address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
 
      #Act
     
      #Assert
      expect(order.valid?).to eq true
    end

    context 'presence' do
      it 'o destinatário deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_name: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_name)).to be true
      end
      
      it 'o CPF deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_registration_number: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_registration_number)).to be true
      end

      it 'o telefone deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_telephone: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_telephone)).to be true
      end

      it 'o e-mail deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_email: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_email)).to be true
      end

      it 'o endereço de destino deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_address: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_address)).to be true
      end

      it 'o CEP de destino deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_postal_code: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_postal_code)).to be true
      end

      it 'a cidade de destino deve ser preenchida' do
        #Arrange
        order = Order.new(recipient_city: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_city)).to be true
      end

      it 'o estado de destino deve ser preenchido' do
        #Arrange
        order = Order.new(recipient_state: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_state)).to be true
      end

      it 'o código do produto deve ser preenchido' do
        #Arrange
        order = Order.new(product_code:'')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:product_code)).to be true
      end

      it 'o comprimento do produto deve ser preenchido' do
        #Arrange
        order = Order.new(product_length: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:product_length)).to be true
      end

      it 'a altura do produto deve ser preenchida' do
        #Arrange
        order = Order.new(product_height: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:product_height)).to be true
      end

      it 'a largura do produto deve ser preenchida' do
        #Arrange
        order = Order.new(product_width: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:product_width)).to be true
      end

      it 'o peso do produto deve ser preenchido' do
        #Arrange
        order = Order.new(product_weight: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:product_weight)).to be true
      end

      it 'o endereço de coleta deve ser preenchido' do
        #Arrange
        order = Order.new(address: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:address)).to be true
      end

      it 'o CEP deve ser preenchido' do
        #Arrange
        order = Order.new(postal_code: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:postal_code)).to be true
      end

      it 'a cidade deve ser preenchida' do
        #Arrange
        order = Order.new(city: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:city)).to be true
      end

      it 'o estado deve ser preenchido' do
        #Arrange
        order = Order.new(state: '')
   
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:state)).to be true
      end
    end

    context 'format' do
      it 'o CPF deve ter menos que 11 dígitos' do
        #Arrange
        order = Order.new(recipient_registration_number: '198.163.877-4')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_registration_number)).to be true
      end

      it 'o CPF não deve ter mais que 11 dígitos' do
        #Arrange
        order = Order.new(recipient_registration_number: '198.163.877-444')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_registration_number)).to be true
      end

      it 'o telefone não deve ter menos que 10' do
        #Arrange
        order = Order.new(recipient_telephone: '229852220')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_telephone)).to be true
      end

      it 'o telefone não deve ter mais que 11 dígitos' do
        #Arrange
        order = Order.new(recipient_telephone: '229852200320')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_telephone)).to be true
      end

      it 'o e-mail deve ter um formato válido' do
        #Arrange
        order = Order.new(recipient_email: '@gmail.com')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_email)).to be true
      end

      it 'o CEP de destino não deve ter menos que 8 dígitos' do
        #Arrange
        order = Order.new(recipient_postal_code: '2715-520')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_postal_code)).to be true
      end

      it 'o CEP de destino não deve ter mais que 8 dígitos' do
        #Arrange
        order = Order.new(recipient_postal_code: '270015-520')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:recipient_postal_code)).to be true
      end

      it 'o CEP de coleta não deve ter menos que 8 dígitos' do
        #Arrange
        order = Order.new(postal_code: '5300-000')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:postal_code)).to be true
      end

      it 'o CEP de coleta não deve ter mais que 8 dígitos' do
        #Arrange
        order = Order.new(postal_code: '530000-000')
        
        #Act
        order.valid?

        #Assert
        expect(order.errors.include?(:postal_code)).to be true
      end
    end
  end

  describe '#delivery_address' do
    it 'exibe o endereço, a cidade e o estado de destino' do
      #Arrange
      order = Order.new(recipient_address: 'Rua das Flores, 204', recipient_city: 'Maricá', recipient_state: 'RJ')

      #Act
      result = order.delivery_address

      #Assert
      expect(result).to eq('Rua das Flores, 204 - Maricá - RJ')
    end
  end

  describe '#full_address' do
    it 'exibe o endereço, a cidade e o estado de coleta' do
      #Arrange
      order = Order.new(address: 'Rua das Bandeiras, 50', city: 'São Paulo', state: 'SP')

      #Act
      result = order.full_address

      #Assert
      expect(result).to eq('Rua das Bandeiras, 50 - São Paulo - SP')
    end
  end

  describe '#dimensions' do
    it 'exibe o comprimento, largura e altura do produto' do
      #Arrange
      order = Order.new(product_height: '60', product_length: '90', product_width: '10')

      #Act
      result = order.dimensions

      #Assert
      expect(result).to eq('90 cm x 10 cm x 60 cm')
    end
  end

  describe 'Gera um código de rastreamento aleatório' do
    it 'ao criar uma ordem de serviço' do
      #Arrange
      company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

      order = Order.new(company: company, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                        recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                        recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                        recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                        product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                        address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
      
      #Act
      order.save!
      result = order.tracking_code

      #Assert
      expect(order.tracking_code).not_to be_empty
      expect(result.length).to eq 15
    end

    it 'e o código de rastreamento é único' do
      #Arrange
      company = Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

      first_order = Order.create!(company: company, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                        recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                        recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                        recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                        product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                        address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')

      second_order = Order.new(company: company, recipient_name: 'Marcelo Santos', recipient_registration_number: '177.163.877-14', 
                          recipient_telephone: '22985402240', recipient_email: 'marcelo@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
      
      #Act
      second_order.save!
      
      #Assert
      expect(second_order.tracking_code).not_to eq first_order.tracking_code
    end
  end
end
