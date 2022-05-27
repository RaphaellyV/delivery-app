require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando o nome fantasia não é preenchido' do
        #Arrange
        company = Company.new(brand_name: '', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando a razão social não é preenchida' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: '', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando o domínio não é preenchido' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando o CNPJ não é preenchido' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando o CEP não é preenchido' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando o endereço não é preenchido' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: '', city: 'Barueri', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando a cidade não é preenchida' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: '', state: 'SP')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end

      it 'falso quando o estado não é preenchido' do
        #Arrange
        company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                    registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                    billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: '')
   
        #Act
       
        #Assert
        expect(company.valid?).to eq false
      end
    end

    context 'uniqueness' do
      it 'falso quando o CNPJ já está em uso' do
        #Arrange
        first_company = Company.create(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        
        second_company = Company.create(brand_name: 'Olist Express', corporate_name: 'OLIST TECNOLOGIA EIRELI', domain:'@olist.com.br', 
                                     registration_number: '30.320.042/0001-70', postal_code: '26360-000', 
                                     billing_address: 'Avenida das Flores, 1280', city: 'Rio de Janeiro', state: 'RJ')                            
  
        #Act
  
        #Assert
        expect(second_company.valid?).to eq false
      end

      it 'falso quando o domínio já está em uso' do
        #Arrange
        first_company = Company.create(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        
        second_company = Company.create(brand_name: 'Olist Express', corporate_name: 'OLIST TECNOLOGIA EIRELI', domain:'@olistpax.com.br', 
                                     registration_number: '30.360.042/0001-70', postal_code: '26360-000', 
                                     billing_address: 'Avenida das Flores, 1280', city: 'Rio de Janeiro', state: 'RJ')                            
  
        #Act
  
        #Assert
        expect(second_company.valid?).to eq false
      end
    end
  end

  context 'format' do
    it 'falso quando o CEP tem menos dígitos que o esperado' do
      #Arrange
      company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                            registration_number: '30.320.042/0001-70', postal_code: '26360-00', 
                            billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
      
      #Act
        
      #Assert
      expect(company.valid?).to eq false
    end

    it 'falso quando o CEP tem mais dígitos que o esperado' do
      #Arrange
      company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                            registration_number: '30.320.042/0001-70', postal_code: '26360-0000', 
                            billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
      
      #Act
        
      #Assert
      expect(company.valid?).to eq false
    end

    it 'falso quando o CNPJ tem menos dígitos que o esperado' do
      #Arrange
      company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                            registration_number: '30.320.042/0001-7', postal_code: '26360-000', 
                            billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
      
      #Act
        
      #Assert
      expect(company.valid?).to eq false
    end

    it 'falso quando o CNPJ tem mais dígitos que o esperado' do
      #Arrange
      company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                            registration_number: '30.320.042/0001-700', postal_code: '26360-000', 
                            billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
      
      #Act
        
      #Assert
      expect(company.valid?).to eq false
    end

    it 'falso quando o domínio tem o formato incorreto' do
      #Arrange
      company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'olistpax.com.br', 
                            registration_number: '30.320.042/0001-70', postal_code: '26360-000', 
                            billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
      
      #Act
        
      #Assert
      expect(company.valid?).to eq false
    end
  end
end
