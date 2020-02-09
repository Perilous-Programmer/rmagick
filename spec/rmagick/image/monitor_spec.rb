RSpec.describe Magick::Image, '#monitor' do
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
    expect { @img.monitor }.to raise_error(NoMethodError)
    monitor = proc { |name, _q, _s| puts name }
    expect { @img.monitor = monitor }.not_to raise_error
    expect { @img.monitor = nil }.not_to raise_error
  end
end
