require "rails_helper"

describe PendingInvitation do
  it { should belong_to :invitation }
  it { should validate_presence_of :user_email }
end
