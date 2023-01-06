class Lease < ApplicationRecord
  validates :apartment_id && :tenant_id && :rent, presence: true

  belongs_to :apartment
  belongs_to :tenant
end
