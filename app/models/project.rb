class Project < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  def some_untested_code
    'Something'
  end
end
