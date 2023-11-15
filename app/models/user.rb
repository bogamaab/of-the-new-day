class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :admin
  has_one :consultant
  has_one :technician
  belongs_to :city

  validates :first_name, :last_name, :address, presence: true

  validates :identification_number, presence: true, uniqueness: true,
    format: { with: /\A[0-9]*\z/ }, length: { in: 8..15 }

  validates :contact_number, presence: true,
    format: { with: /\A[0-9]*\z/ }, length: { in: 7..10 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_admin?
    admin.present?
  end

  def is_consultant?
    consultant.present?
  end

  def is_technician?
    technician.present?
  end
end
