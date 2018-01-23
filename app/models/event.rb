class Event < ApplicationRecord

  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :visitors, through: :bookings, source: :user

  validates :name, presence: true
  # validates :description, presence: true, length: { maximum: 500 }
  # validates :location, presence: true
  # validates :price, presence: true
  # validates :capacity, presence: true
  # validates :starts_at, presence: true
  # validates :ends_at, presence: true
  #validates :ends_at, presence: true, inclusion: {in: ((:starts_at + 1.days)..(:starts_at + 5.years))}

  def self.current_capacity
    Event.sum(:capacity)
  end

  def intimate?
    capacity <= 25
  end

  def self.count_events
    Event.count
  end

  def self.order_by_price
    order :price
  end

end
