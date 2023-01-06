class Apartment < ApplicationRecord
    validates :number, uniqueness: true, on: :create

    has_many :leases
    has_many :tenants, through: :leases
end
