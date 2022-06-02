class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :company  

  validates :name, presence: true

  before_validation :assign_admin

  def assign_admin
    self.company = Company.find_by(domain: "@"+self.email.split("@")[1])
    if /\w@sistemadefrete.com.br/.match(self.email)
      self.admin = true
    end
  end

  def description
    "#{name} - #{email}"
  end
end
