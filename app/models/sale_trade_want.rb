class SaleTradeWant < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :private_posts

  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :type_stw, presence: true
  validates :active, presence: true, acceptance: { accept: ['true', 'false'] }


  # before_validation :downcase_email
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  private

    def downcase_email
        self.email.downcase! if email.present?
    end

end
