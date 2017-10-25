class Invitation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :event
  has_many :pending_invitations, dependent: :destroy
  has_and_belongs_to_many :users
  before_destroy :destroy_event

  validates :user_email, presence: true

  def to_param
    uuid
  end

  def rsvps
    users.where("email != ?", event.user.email)
  end

  def destroy_event
    self.event.destroy
  end
end
