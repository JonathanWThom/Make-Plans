class Invitation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :event
  has_many :pending_invitations
  has_and_belongs_to_many :users

  def to_param
    uuid
  end

end
