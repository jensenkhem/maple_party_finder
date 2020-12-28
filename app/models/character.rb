class Character < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: {maximum: 13}, uniqueness: true
end
