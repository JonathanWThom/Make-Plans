require 'rails_helper'

describe User do
  it { should have_many :activities }
  it { should have_many(:events).through(:activities)}
end
