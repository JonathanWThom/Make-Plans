class Event < ActiveRecord::Base
  has_many :invitations
  has_many :activities, through: :invitations
end
