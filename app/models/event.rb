class Event < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  #validates :ends_at, presence: true, inclusion: {in: ((:starts_at + 1.days)..(:starts_at + 5.years))}

end
