class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :client
  has_one :deliveryman

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :deliveryman
  
end
