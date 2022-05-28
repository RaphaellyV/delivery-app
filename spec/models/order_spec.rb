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
      it 'falso quando o destinatário não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: '', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end
      
      it 'falso quando o CPF não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o telefone não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o e-mail não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: '', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o endereço de destino não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: '', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CEP de destino não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando a cidade de destino não é preenchida' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: '', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o estado de destino não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: '', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o código do produto não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'', 
                          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o comprimento do produto não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '', product_height: '60', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando a altura do produto não é preenchida' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '', product_width: '10', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando a largura do produto não é preenchida' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '10', product_width: '', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o peso do produto não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '10', product_width: '60', product_weight: '', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o endereço de coleta não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '10', product_width: '60', product_weight: '10000', 
                          address: '', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CEP não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '10', product_width: '60', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '', city: 'São Paulo', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando a cidade não é preenchida' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '10', product_width: '60', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: '', state: 'SP')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o estado não é preenchido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
                                  registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
                                  billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')
        
        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-14', 
                          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
                          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
                          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
                          product_length: '90', product_height: '10', product_width: '60', product_weight: '10000', 
                          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: '')
   
        #Act
       
        #Assert
        expect(order.valid?).to eq false
      end
    end

    context 'format' do
      it 'falso quando o CPF tem menos dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-4', 
          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CPF tem mais dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-444', 
          recipient_telephone: '22985202240', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o telefone tem menos dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '229852220', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o telefone tem mais dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '229852200320', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o e-mail não é válido' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '22985200320', recipient_email: '@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '24715-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CEP de destino tem menos dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '22985200320', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '2715-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CEP de destino tem mais dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '22985200320', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '270015-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '53300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CEP de coleta tem menos dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '22985200320', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '27015-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '5300-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
      end

      it 'falso quando o CEP de coleta tem mais dígitos que o esperado' do
        #Arrange
        Company.create!(brand_name: 'ASAP Log', corporate_name: 'Asap Log Ltda', domain:'@asaplog.com.br', 
          registration_number: '19.629.612/0001-76', postal_code: '80020-090', 
          billing_address: 'Avenida Marechal Floriano Peixoto, 96', city: 'Curitiba', state: 'PR')

        order = Order.new(company_id: 1, recipient_name: 'Helena Silva', recipient_registration_number: '198.163.877-44', 
          recipient_telephone: '22985200320', recipient_email: 'helena@gmail.com', 
          recipient_address: 'Rua Caetés, 360', recipient_postal_code: '27015-520', 
          recipient_city: 'Maricá', recipient_state: 'RJ', product_code:'TV40-SAMS-XPTO', 
          product_length: '90', product_height: '60', product_width: '10', product_weight: '10000', 
          address: 'Rua das Bandeiras, 450', postal_code: '530000-000', city: 'São Paulo', state: 'SP')
        
        #Act
          
        #Assert
        expect(order.valid?).to eq false
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
