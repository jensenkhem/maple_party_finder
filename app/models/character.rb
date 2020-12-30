class Character < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :groups
    validates :name, presence: true, length: {maximum: 13}, uniqueness: true
    validates :level, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 275, greater_than_or_equal_to: 1}
    validates :stat, presence: true, numericality: {greater_than_or_equal_to: 0}
end
