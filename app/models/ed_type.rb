class EdType < ApplicationRecord
    has_many :ed_pursuits
    has_many :users, through: :ed_pursuits
end
