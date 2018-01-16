class Event < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  #validates :ends_at, presence: true, inclusion: {in: (:start_at + 1.days..:start_at + 5.years)}

end
