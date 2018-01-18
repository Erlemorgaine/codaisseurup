class Event < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :location, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  #validates :includes_food, presence: true
  #validates :includes_drinks, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  #validates :ends_at, presence: true, inclusion: {in: ((:starts_at + 1.days)..(:starts_at + 5.years))}

  def intimate?
    capacity <= 25
  end

  def self.order_by_price
    order :price
  end

end
