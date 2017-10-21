class Activity < ActiveRecord::Base
  include Convertable
  include ActiveModel::Validations

  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :events, through: :invitations, dependent: :destroy
  after_commit :convert_happening_at, on: [:create, :update]

  validates :description, :location, :title, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with DateValidator

  scope :nearby, -> (latitude, longitude) {
    where("latitude >= ? AND latitude <= ?", latitude - 2, latitude + 2).
    where("longitude >= ? AND longitude <= ?", longitude - 2, longitude + 2).
    where(public: true)
  }

  def image_url
    image.url(:medium)
  end
end
