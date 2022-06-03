class Post < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  has_rich_text :body

  def self.most_recent(num)
    order(updated_at: :desc).first(num)
  end
end
