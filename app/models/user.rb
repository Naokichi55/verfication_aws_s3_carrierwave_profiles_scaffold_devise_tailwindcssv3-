class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rackets, dependent: :destroy
  has_one :profile, dependent: :destroy

  #投稿者がログインユーザーと同じか確認するメソッドを定義
  def own?(object)
    id == object&.user_id
  end

end
