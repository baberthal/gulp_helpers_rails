require 'rails_helper'

RSpec.describe GulpHelpers do
  it 'has a version number' do
    expect(GulpHelpers::VERSION).to_not be nil
  end

  describe '#asset_path' do
    it 'can get and set the asset path' do
      GulpHelpers.config
      GulpHelpers.asset_path = 'public/assets'
      expect(GulpHelpers.asset_path).to eq 'public/assets'
    end
  end
end
