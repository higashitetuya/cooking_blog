class Cooking < ApplicationRecord
  attachment :cooking_image
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
  has_many :cooking_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, length: { minimum: 3 }
  validates :cooking_introduction, length: { minimum: 5, maximum: 100 }
  validates :cooking_image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
