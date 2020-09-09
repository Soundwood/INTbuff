class User < ApplicationRecord
    has_many :ed_pursuits
    has_many :notes, through: :ed_pursuits
end
