class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :user_assets
  has_many :assets, through: :user_assets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
