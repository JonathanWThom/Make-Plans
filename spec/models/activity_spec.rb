describe Activity do
  it { should belong_to :user }
  it { should have_many(:invitations).dependent(:destroy) }
  it { should have_many(:events).through(:invitations).dependent(:destroy) }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :title }

  context "callbacks" do
    it "will call \'convert_happening_at\' after create" do
      activity = create("activity")
      expect(activity).to receive(:convert_happening_at)
    end
  end

  # after_commit :convert_happening_at, on: [:create, :update]
  #
  # validates :description, :location, :title, presence: true
  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # validates_with DateValidator
  #
  # scope :nearby, -> (latitude, longitude) {
  #   where("latitude >= ? AND latitude <= ?", latitude - 2, latitude + 2).
  #   where("longitude >= ? AND longitude <= ?", longitude - 2, longitude + 2).
  #   where(public: true)
  # }
  #
  # def image_url
  #   image.url(:medium)
  # end
end
