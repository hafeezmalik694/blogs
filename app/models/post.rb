class Post < ApplicationRecord

  #associations
  belongs_to :user
  has_many :likes, dependent: :destroy

  #validations
  validates :title, :content, presence: true


  def liked_by?(user)
    likes.exists?(user: user)
  end
end
