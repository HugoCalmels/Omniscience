class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    
  validates :name, length: { minimum: 3 ,maximum: 20}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  
  
  has_many :videos
  has_many :comments
  has_one_attached :avatar

end
