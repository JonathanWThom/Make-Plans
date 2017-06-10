require "rails_helper"

describe Event do
  it { should have_many :activities }
  it { should have_many(:users).through(:activities) }
end
