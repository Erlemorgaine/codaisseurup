require 'rails_helper'

describe "Current user viewing the list of events" do
  before { login_as user }

  let(:user) {create :user, email: "current@user.com"}
  let(:other_user) { create :user, email: "other@user.com"}

  let!(:event1) { create :event, name: "Nice concert", user: user}
  let!(:event2) { create :event, name: "Cool festival", user: user}
  let!(:event3) { create :event, name: "Cosy meetup", user: other_user}

  it "shows all his events" do
    visit events_url

    expect(page).to have_text("Nice concert")
    expect(page).to have_text("Cool festival")
  end

  it "does not show other user's events" do
    visit events_url

    expect(page).not_to have_text("Cosy meetup")
  end

end
