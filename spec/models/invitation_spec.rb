require "rails_helper"

describe Invitation do
  it { should belong_to :event }
  it { should belong_to :activity }
end
