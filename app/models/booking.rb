class Booking < ApplicationRecord

  belongs_to :event
  belongs_to :user, optional: true

  validates :guest_count, presence: true, :numericality => { :less_than => 4 }

  def set_total_price
    if guest_count > 0 && guest_count < 4
      self.price = @event.price
      self.total = price * guest_count
    else
      return 0
    end
  end
end
