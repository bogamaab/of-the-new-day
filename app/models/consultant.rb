class Consultant < ApplicationRecord
  belongs_to :user

  delegate :first_name, :last_name, :address, :identification_number,
    :contact_number, :email, to: :user, allow_nil: false

  accepts_nested_attributes_for :user
end
