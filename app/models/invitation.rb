class Invitation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :event
end
