require 'rails_helper'

RSpec.describe Company, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'o nome fantasia deve ser preenchido' do
        #Arrange
        company = Company.new(brand_name: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:brand_name)).to be true
      end

      it 'a razão social deve ser preenchida' do
        #Arrange
        company = Company.new(corporate_name: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:corporate_name)).to be true
      end

      it 'o domínio deve ser preenchido' do
        #Arrange
        company = Company.new(domain:'')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:domain)).to be true
      end

      it 'o CNPJ deve ser preenchido' do
        #Arrange
        company = Company.new(registration_number: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:registration_number)).to be true
      end

      it 'o CEP deve ser preenchido' do
        #Arrange
        company = Company.new(postal_code: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:postal_code)).to be true
      end

      it 'o endereço deve ser preenchido' do
        #Arrange
        company = Company.new(billing_address: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:billing_address)).to be true
      end

      it 'a cidade deve ser preenchida' do
        #Arrange
        company = Company.new(city: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:city)).to be true
      end

      it 'o estado deve ser preenchido' do
        #Arrange
        company = Company.new(state: '')
   
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:state)).to be true
      end
    end

    context 'uniqueness' do
      it 'o CNPJ deve ser único' do
        #Arrange
        first_company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        
        second_company = Company.new(registration_number: '30.320.042/0001-70')                            
  
        #Act
        second_company.valid?

        #Assert
        expect(second_company.errors.include?(:registration_number)).to be true
      end

      it 'o domínio deve ser único' do
        #Arrange
        first_company = Company.create!(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', domain:'@olistpax.com.br', 
                              registration_number: '30.320.042/0001-70', postal_code: '06460-000', 
                              billing_address: 'Avenida Tamboré, 1180', city: 'Barueri', state: 'SP')
        
        second_company = Company.new(domain:'@olistpax.com.br')                            
  
        #Act
        second_company.valid?

        #Assert
        expect(second_company.errors.include?(:domain)).to be true
      end
    end

    context 'format' do
      it 'o CEP não deve ter menos que 8 dígitos' do
        #Arrange
        company = Company.new(postal_code: '26360-00')
        
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:postal_code)).to be true
      end
  
      it 'o CEP não deve ter mais que 8 dígitos' do
        #Arrange
        company = Company.new(postal_code: '26360-0000')
        
        #Act
          
        #Assert
        expect(company.valid?).to eq false
      end
  
      it 'o CNPJ não deve ter menos que 14 dígitos' do
        #Arrange
        company = Company.new(registration_number: '30.320.042/0001-7')
        
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:registration_number)).to be true
      end
  
      it 'o CNPJ não deve ter mais que 14 dígitos' do
        #Arrange
        company = Company.new(registration_number: '30.320.042/0001-700')
        
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:registration_number)).to be true
      end
  
      it 'o domínio deve ter um formato válido' do
        #Arrange
        company = Company.new(domain:'olistpax.com.br')
        
        #Act
        company.valid?

        #Assert
        expect(company.errors.include?(:domain)).to be true
      end
    end
  end  

  describe '#full_description' do
    it 'exibe o nome fantasia, a razão social e o estado' do
      #Arrange
      company = Company.new(brand_name: 'Olist Pax', corporate_name: 'PAX TECNOLOGIA EIRELI (“PAX”)', state: 'SP')

      #Act
      result = company.full_description

      #Assert
      expect(result).to eq('Olist Pax | PAX TECNOLOGIA EIRELI (“PAX”) | SP')
    end
  end
end
