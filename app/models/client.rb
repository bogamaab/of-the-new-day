class Client < ApplicationRecord
  validates :first_name, :last_name, :address, :account_number, presence: true

  validates :contact_number, presence: true,
    format: { with: /\A[0-9]*\z/ }, length: { in: 7..10 }

  belongs_to :city
  has_one :visit

  def full_name
    "#{first_name} #{last_name}"
  end
end
