class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_exams, dependent: :delete_all
  has_many :user_answers, dependent: :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
