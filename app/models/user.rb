class User < ApplicationRecord
  has_many :images, dependent: :destroy

  devise :database_authenticatable, :registerable, :trackable, :validatable

  def assign_auth_token!
    loop do
      self.auth_token = SecureRandom.base64(50)
      break unless User.exists?(auth_token: auth_token)
    end
    save!
  end
end
