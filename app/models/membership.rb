class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum role: { admin: 0, user: 1, guest: 2 }
end
