require "rails_helper"

describe Invitation do
  it { should belong_to :event }
  it { should belong_to :activity }
  it { should have_and_belong_to_many :users }
end
