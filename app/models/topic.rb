class Topic < ApplicationRecord
  belongs_to :category
  has_many :sale_trade_wants

  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 10}
  # validates :enddate, presence: true
  # validates :enable, presence: true, acceptance: { accept: ['true', 'false'] }
  # validates :owner, presence: true

  def self.search_in_topics(query)
      Topic.where(["title       LIKE ?","%#{query}%"]).or(
      Topic.where(["description LIKE ?","%#{query}%"])   ).all
  end

end
