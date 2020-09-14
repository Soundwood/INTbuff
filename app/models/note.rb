class Note < ApplicationRecord
  belongs_to :user
  belongs_to :ed_pursuit
  validates :title, presence: true
  validates :content, presence: true
  validates :ed_pursuit_id, presence: true

  # scope :for_user, -> (userid) { where("user_id" == ?, userid)}
  
end