class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :projects, through: :memberships

  def name
    "#{first_name} #{last_name}"
  end
end
