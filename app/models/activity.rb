class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :events, through: :invitations

  validates :title, :image, :description, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :nearby, -> (latitude, longitude) {
    where("latitude >= ? AND latitude <= ?", latitude - 2, latitude + 2).
    where("longitude >= ? AND longitude <= ?", longitude - 2, longitude + 2).
    where(public: true)
  }


  def image_url
    image.url(:medium)
  end
  
end
