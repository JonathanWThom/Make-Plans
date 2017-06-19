describe Event do
  it { should have_many :activities }
  it { should have_many(:activities).through(:invitations) }
  it { should belong_to :user }
end
