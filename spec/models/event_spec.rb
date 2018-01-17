require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:capacity) }
    it { is_expected.to validate_presence_of(:includes_food) }
    it { is_expected.to validate_presence_of(:includes_drinks) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
  end

  describe "#intimate?" do
    let(:intimate_event) { create :event, capacity: 25 }
    let(:non_intimate_event) { create :event, capacity: 26 }

    it "returns true of the capacity is equal to or smaller than 25" do
      expect(intimate_event.intimate?).to eq(true)
      expect(non_intimate_event.intimate?).to eq(false)
    end

    describe ".order_by_price" do
      let!(:event1) { create :event, price: 10}
      let!(:event2) { create :event, price: 30}
      let!(:event3) { create :event, price: 20}

      it "returns a sorted array of events by prices" do

        ordered = Event.order_by_price
        expect(Event.order_by_price).to eq(ordered)
      end

      describe "association with user" do
        let(:user) { create :user }

        it "belongs to a user" do
          event = user.events.build(event_type: "Art")

          expect(event.user).to eq(user)
        end
      end

      describe "association with category" do
        let(:event) { create :event }

        let(:category1) { create :category, name: "Bright", events: [event] }
        let(:category2) { create :category, name: "Clean lines", events: [event] }
        let(:category3) { create :category, name: "A Man's Touch", events: [event] }

        it "has category" do
          expect(event.categories).to include(category1)
          expect(event.categories).to include(category2)
          expect(event.categories).to include(category3)
        end
      end

    end

  end

end
