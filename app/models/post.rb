class Post < ApplicationRecord
    has_one_attached :main_photo
    has_many_attached :photos
    belongs_to :user
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true, length: { minimum: 10 }
end
