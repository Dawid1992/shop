class Address < ApplicationRecord
  belongs_to :order

  validates :first_name, :last_name, :zip_code, :email, :city, presence: true
end
