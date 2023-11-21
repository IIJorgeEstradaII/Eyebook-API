# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: "friend_id "
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
  validates :lastname, :name, presence: true
       
  def token
    JWT.encode({ user_id: id }, Rails.application.secrets.secret_key_base)
  end

end
