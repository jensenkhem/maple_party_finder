class Group < ApplicationRecord
    scope :filter_by_boss, -> (boss) { where boss: boss }
    has_and_belongs_to_many :characters
    validates :name, presence: true, length: {maximum: 20}, uniqueness: true
    validates :creator, presence: true
    validates :characters, length: {maximum: 6, message: "characters!"}
    cattr_accessor :selected_char
end
