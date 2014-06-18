class Answer < ActiveRecord::Base
  belongs_to :question
  #belongs_to :user

  validates :description,
    presence: true,
    length: {minimum: 50}

  validates :author, presence: true
end
