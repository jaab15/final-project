class Post < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :body, presence: true

  def self.search_in_posts(query)
      Post.where(["body LIKE ?","%#{query}%"]).all
  end

end
