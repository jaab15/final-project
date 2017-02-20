class PrivatePost < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :privatereplyto, presence: true
  validates :emailbuyer, presence: true

  before_validation :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  private

    def downcase_email
        self.email.downcase! if email.present?
    end

end
