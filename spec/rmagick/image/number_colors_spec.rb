RSpec.describe Magick::Image, '#number_colors' do
  before do
    @img = described_class.new(100, 100)
    gc = Magick::Draw.new

    gc.stroke_width(5)
    gc.circle(50, 50, 80, 80)
    gc.draw(@img)

    @hat = described_class.read(FLOWER_HAT).first
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect { @hat.number_colors }.not_to raise_error
    expect(@hat.number_colors).to be_kind_of(Integer)
    expect { @hat.number_colors = 2 }.to raise_error(NoMethodError)
  end
end
