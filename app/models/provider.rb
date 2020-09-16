class Provider < ApplicationRecord
    has_many :users, through: :ed_pursuits
    has_many :ed_pursuits
    validates :name, presence: true
    validates :name, uniqueness: true

end
