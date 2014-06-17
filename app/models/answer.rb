class Answer < ActiveRecord::Base
  belongs_to :questions
  belongs_to :user

  validates :description,
    presence: true
end
