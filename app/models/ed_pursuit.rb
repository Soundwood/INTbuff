class EdPursuit < ApplicationRecord
    belongs_to :user
    has_many :notes
    belongs_to :ed_type
    belongs_to :provider
    validates :name, presence: true
    validates :subject, presence: true
    validates :provider, presence: true

    def provider_attributes=(attributes)
        self.provider = Provider.find_or_create_by(attributes) if !attributes['name'].empty?
        self.provider
    end
    # def provider_name
    #     provider.try(:name)
    # end
end
