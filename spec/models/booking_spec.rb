require 'rails_helper'

RSpec.describe Booking, type: :model do

  describe "validations" do
    it { is_expected.to validate_numericality_of(:guest_count).is_less_than(4) }
  end

end
