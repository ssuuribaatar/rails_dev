class User < ApplicationRecord
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  paginates_per 5

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :email, presence: true, format: { with: /A[^@s] @[^@s] z/, allow_blank: true } 
	validates :password, presence: true, length: { minimum: 6 }	
 	validates :password_confirmation, presence: true, length: { minimum: 6 }
      
end
