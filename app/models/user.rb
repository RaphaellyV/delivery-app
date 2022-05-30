class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true

  before_create :assign_admin

  def assign_admin
    if /\w@sistemadefrete.com.br/.match(self.email)
      self.admin = true
    else

    end
  end

  def description
    "#{name} - #{email}"
  end
end
