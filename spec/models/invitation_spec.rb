describe Invitation do
  it { should belong_to :event }
  it { should belong_to :activity }
  it { should have_many :pending_invitations }
  it { should have_and_belong_to_many :users }

  describe "#rsvps" do
    it "should return all users who have rsvp'd" do

    end
  end
end
