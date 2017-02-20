class UserProfile < ApplicationRecord
  belongs_to :user

  validates :enable,    presence: true
  validates :location,  presence: true
  validates :buyer_id,  presence: true

end
