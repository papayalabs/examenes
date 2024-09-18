class Question < ApplicationRecord
  belongs_to :exam
  has_many :answer

  TYPE_OF_QUESTION = ["free_text","multiple_options","unique_option"]

  validates :type_of_question, inclusion: { in: TYPE_OF_QUESTION, allow_nil: true }
end
