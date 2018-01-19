class Booking < ApplicationRecord

  belongs_to :event
  belongs_to :user

  validates :guest_count, presence: true, :numericality => { :less_than => 4 }

end
