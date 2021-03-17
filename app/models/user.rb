class User < ActiveRecord::Base
    has_secure_password
    has_many :sessions
    validates :username, presence: true
    validates :username, length: { minimum: 1}
    validates :email, presence: true
    validates :email, length: { minimum: 4}
    validates :password, length: {minimum: 4}

end