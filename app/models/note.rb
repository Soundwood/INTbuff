class Note < ApplicationRecord
  belongs_to :user
  belongs_to :ed_pursuit
  validates :title, presence: true
end