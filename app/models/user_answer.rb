class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validate :validate_dates

  private

  def validate_dates
    unless Date.today > answer.question.exam.start && Date.today < answer.question.exam.end
      errors.add(:answer, 'answer has to be inside the start and end date of Exam')
    end
  end
end
