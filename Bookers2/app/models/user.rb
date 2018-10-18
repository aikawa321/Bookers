class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :books, dependent: :destroy
  has_many :home, dependent: :destroy
 validates :name, presence: true, uniqueness: true, length:{minimum:2,maximum:20}
 validates :email, presence: true
 validates :introduction,length:{maximum:50}
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
 # deviseでemailを不必要にする
 def email_required?
   false
 end
 def email_changed?
   false
 end
end
