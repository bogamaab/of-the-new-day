class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :address, presence: true

  validates :identification_number, presence: true, uniqueness: true,
    format: { with: /\A[0-9]*\z/ }, length: { in: 8..15 }

  validates :contact_number, presence: true,
    format: { with: /\A[0-9]*\z/ }, length: { in: 7..10 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
