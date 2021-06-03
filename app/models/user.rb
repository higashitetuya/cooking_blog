class User < ApplicationRecord
  has_secure_password
  attachment :profile_image
  has_many :cookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :cooking_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, length: { minimum: 3 }
  validates :email, presence: true
  validates :introduction, length: { minimum: 5, maximum: 100 }
  validates :profile_image, presence: true
end
