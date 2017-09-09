class User < ApplicationRecord
  has_many :images, dependent: :destroy

  devise :database_authenticatable, :registerable, :trackable, :validatable
end
