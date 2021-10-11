class Post < ApplicationRecord
  #アソシエーション(1:N = user:posts)
  belongs_to :user
  
  #titleとcontentのバリデーション(空欄不可)
  validates :title, presence: true
  validates :content, presence: true
end
