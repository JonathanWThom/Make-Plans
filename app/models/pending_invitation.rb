class PendingInvitation < ActiveRecord::Base
  belongs_to :invitation
  validates :user_email, presence: true
end
