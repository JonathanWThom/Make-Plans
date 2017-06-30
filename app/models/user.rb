class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities
  has_many :events
  has_and_belongs_to_many :invitations

  def future_events
    events.where("date > ?", Date.today).order("date ASC")
  end

  def other_invitations
    invitations.select { |i| i.event.user != self}
  end

end
