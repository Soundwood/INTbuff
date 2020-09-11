class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true, presence: true
    has_many :ed_pursuits
    has_many :notes, through: :ed_pursuits
    has_many :ed_types, through: :ed_pursuits
    has_and_belongs_to_many :goals

    def self.from_google_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
        #   user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

    def self.from_facebook_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
        #   user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

    def self.from_github_omniauth(auth)
        where(email: auth.uid).first_or_initialize do |user|
        #   user.user_name = auth.info.name
          user.email = auth.info.email || auth.uid
          user.password = SecureRandom.hex
        end
    end
end
