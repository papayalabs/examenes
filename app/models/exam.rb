class Exam < ApplicationRecord
  has_many :question
  has_many :user_exams, dependent: :destroy
end
