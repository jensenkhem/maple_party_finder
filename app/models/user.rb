class User < ApplicationRecord
    before_save {self.username = self.username.downcase}
    validates :username, presence: true, length: {maximum: 20}, uniqueness: true
    has_secure_password
    validates :username, presence: true, length: {minimum: 6} 
end
