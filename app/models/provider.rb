class Provider < ApplicationRecord
    has_many :users, through: :ed_pursuits
    has_many :ed_pursuits
    validates :name, presence: true

    scope :order_by_name, -> {order(:name)}
end
