require "rails_helper"

describe Activity do
  it { should belong_to :user }
  it { should have_many(:events).through(:invitations) }
end
