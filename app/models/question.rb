class Question < ActiveRecord::Base
  #belongs_to :user
  has_many :answers
  validates :title,
    presence: true

  validates :description,
    presence: true

  validates :author, presence: true
end
