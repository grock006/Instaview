class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :access_token, type: String
  field :profile_picture, type: String
  has_many :favorites

  has_secure_password 
  # validates :username, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
end
