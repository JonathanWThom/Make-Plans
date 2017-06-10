require "rails_helper"

describe Event do
  it { should have_many :activities }
  it { should have_many(:activities).through(:invitations) }
end
