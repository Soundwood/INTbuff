class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true, presence: true
    has_many :ed_pursuits
    has_many :notes, through: :ed_pursuits
end
