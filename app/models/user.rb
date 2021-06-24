class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
  validates :password, length: {minimum: 8, maximum: 32}
  
  PASSWORD_REGEX = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
  validates_format_of :password, with: PASSWORD_REGEX
end