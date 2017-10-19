describe Activity do
  it { should belong_to :user }
  it { should have_many(:events).through(:invitations) }
  it { should validate_presence_of :title }
end
