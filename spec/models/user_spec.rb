require "rails_helper"

describe User do
  it { should have_many :activities }
  it { should have_many :events }
  it { should have_and_belong_to_many :invitations }

  describe "#future_events" do
    it "will return all of the users events in the future, in ascending order" do
      user = create(:user)
      further_future_event = create(:event, date: Date.today + 2, user_id: user.id)
      future_event = create(:event, user_id: user.id)
      past_event = create(:event, date: Date.today - 1, user_id: user.id)
      expect(user.future_events).to eq([future_event, further_future_event])
    end
  end

  describe "#other_invitations" do
    it "will return events the user has rsvp'd to, and not ones they've created" do
      user1 = create(:user)
      user2 = create(:user, email: "user2@email.com")
      event1 = create(:event, user_id: user1.id)
      event2 = create(:event, user_id: user2.id)
      invitation1 = Invitation.create(event_id: event1.id)
      invitation2 = Invitation.create(event_id: event2.id)
      invitation2.users << user1
      expect(user1.other_invitations).to eq([invitation2])
    end
  end
end
