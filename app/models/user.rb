VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
class User < ApplicationRecord
	before_save {self.email.downcase!}
	
	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
	validates :name, presence: true, length: {maximum: 50}
	validates :password, presence: true, length:{minimum: 8}
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
end
