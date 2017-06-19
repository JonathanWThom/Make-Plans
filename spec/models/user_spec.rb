describe User do
  it { should have_many :activities }
  it { should have_many :events }
  it { should have_and_belong_to_many :invitations }
end
