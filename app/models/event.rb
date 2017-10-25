class Event < ActiveRecord::Base
  include Convertable
  has_many :activities, through: :invitations
  has_many :invitations
  belongs_to :user

  validates :happening_at_string, presence: true

  accepts_nested_attributes_for :invitations

  after_create :convert_happening_at

  def invitation_rsvps
    invitations.select { |invite| invite.rsvps.present? }
  end
end
