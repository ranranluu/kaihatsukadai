class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #deviseでの自動記述
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #アソシエーション(1:N = user:posts)
  has_many :posts, dependent: :destroy
  
  #nameのバリデーション(空欄不可)
  validates :name, presence: true
end
