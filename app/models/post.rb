class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many_attached :photos
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  has_rich_text :body
  validates_presence_of :title, :body, :slug

  def self.most_recent(num)
    order(updated_at: :desc).first(num)
  end
end
