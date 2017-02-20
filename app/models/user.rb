class User < ApplicationRecord
    has_many :photos, dependent: :destroy
    has_many :topics
    has_many :posts
    has_many :private_posts
    has_many :sale_trade_wants
    has_many :user_preferences, dependent: :destroy

    has_secure_password

    before_validation :downcase_email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

      # def signed_in_with_twitter?
      #     uid.present? && provider == 'twitter'
      # end

      def full_name
          "#{first_name} #{last_name}".strip.squeeze(' ').titleize
      end

private

      def downcase_email
          self.email.downcase! if email.present?
      end

end
