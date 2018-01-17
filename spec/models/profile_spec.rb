require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S")}

      let(:sjudit) {create :profile, first_name: "Sjudit"}
      let(:dino) {create :profile, first_name: "Dino"}
      let(:serle) {create :profile, first_name: "Serle"}

      context "matching letters" do
        it "returns the profiles that match the initial" do
          expect(subject).to match_array([sjudit, serle])
        end
      end

      context "non-matching letters" do
        it "is sorted on first_name" do
          expect(subject).to eq([serle, sjudit])
        end
      end
  end
end
