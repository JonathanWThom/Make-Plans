describe Activity do
  it { should belong_to :user }
  it { should have_many(:invitations).dependent(:destroy) }
  it { should have_many(:events).through(:invitations).dependent(:destroy) }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
  it { should validate_presence_of :title }

  it "will convert happening_at_string after create" do
    activity = create(:activity)
    expect(activity.happening_at).to be_a Time
  end

  it "will convert happening_at_string after update" do
    activity = create(:activity, happening_at_string: nil)
    activity.update(happening_at_string: "10/21/2017 3:10 PM")
    expect(activity.happening_at).to be_a Time
  end

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).allowing('image/*') }

  describe ".nearby" do
    it "should return all public activities within 2 degrees lat and long" do
      activity = create(:activity)
      nearby_but_not_public = create(:activity, public: false, latitude: 48, longitude: 122)
      public_but_not_nearby = create(:activity, public: true, latitude: 40, longitude: 122)
      nearby_and_public = create(:activity, public: true, latitude: 48, longitude: 122)
      expect(Activity.nearby(50, 124)).to eq([nearby_and_public])
    end
  end
end
