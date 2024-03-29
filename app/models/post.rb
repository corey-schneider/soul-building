class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many_attached :photos
  belongs_to :cover_photo, class_name: 'ActiveStorage::Attachment', foreign_key: 'cover_photo_id', optional: true
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  has_rich_text :body
  validates_presence_of :title, :body, :slug

  def self.most_recent(num)
    order(updated_at: :desc).first(num)
  end

  def construction_dates
    if start_date.nil?
      created_at.strftime('%b %Y')
    elsif end_date.nil?
      "#{start_date.strftime('%b %Y')} - present"
    elsif start_date.year == end_date.year
      "#{start_date.strftime('%b')} - #{end_date.strftime('%b %Y')}"
    else
      "#{start_date.strftime('%b %Y')} - #{end_date.strftime('%b %Y')}"
    end
  end
end
