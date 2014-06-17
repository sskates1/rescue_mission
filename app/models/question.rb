class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  validates :title,
    presence: true

  validates :description,
    presence: true

  validates :user_id,
  presence: true,
  numericality: {only_integer: true}
end
