class EdPursuit < ApplicationRecord
    belongs_to :user
    has_many :notes
    belongs_to :ed_type
    validates :name, presence: true
    validates :subject, presence: true
    validates :provider, presence: true
end
