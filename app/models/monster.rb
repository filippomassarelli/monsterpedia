class Monster < ApplicationRecord
    validates :name, presence: true
    validates :tribe, presence: true
    validates :quote, presence: true
end
