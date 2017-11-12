describe Event do
  it { should have_many :activities }
  it { should have_many(:activities).through(:invitations) }
  it { should belong_to :user }
  it { should validate_presence_of :invitee_email }
  it { should validate_presence_of :happening_at_string }
end
