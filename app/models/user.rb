class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
def email_required?
    false
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books,dependent: :destroy
         validates :name, presence:true
         validates :name, length: {in: 2..20}
         validates :introduction, length: { maximum: 50}
         attachment :profile_image
end
