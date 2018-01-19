require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association with event" do
    let!(:user) { create :user }
    let!(:event) { create :event, user: user }

    it "has many events" do
      event1 = user.events.new(name: "Concert")
      event2 = user.events.new(name: "Festival")

      expect(user.events).to include(event1)
      expect(user.events).to include(event2)
    end

    it "deletes associated events" do
      expect { user.destroy }.to change(Event, :count).by(-1)
    end
  end

  describe "association with booking" do
    let(:visitor_user) { create :user, email: "visitor@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:booking) { create :booking, event: event, user: visitor_user, guest_count: 2 }

    it "has bookings" do
      expect(visitor_user.booked_events).to include(event)
    end
  end
end
