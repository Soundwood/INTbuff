class EdPursuit < ApplicationRecord
    belongs_to :user
    has_many :notes
    validates :name, presence: true
    validates :subject, presence: true
    validates :provider, presence: true
end
